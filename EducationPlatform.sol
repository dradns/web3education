// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract EducationPlatform2 {

    //  test function for frontend check
        function testGetFirstCourse() public pure returns (uint) {
        return 999;
    }

    //course entity
    struct Course  {
        uint courseId;
        string name;
        string description;
        uint difficulty;
        string img;
    }

    //user entity
    struct User {
        address userId;
        uint balance;
        bool isRewier;
    }

    //course in progress entity
    struct UserToCourse {
        uint courseId;
        address userId;
        bool isSubmitted;
        string comment;
        bool isChecked;
    }

    // array of all courses that are in progress;
    UserToCourse[] userCourses;

    //registration to specific course from specific user
    function addCourseToMyList(uint _courseId) public {
        userCourses.push(UserToCourse(_courseId, msg.sender, false,"",false));
    }

    //get length of array userCourses to iterate throw this array
    function getUserCoursesLength() public view returns (uint){
        return userCourses.length;
    }

    //get all registered courses for current user
    function getAllMyRegisteredCourses() public view returns (UserToCourse[] memory){
        uint counter = 0;
        uint j = 0;
        for (uint i = 0; i < userCourses.length; i++){
            if (userCourses[i].userId == msg.sender){
                counter++;
            }
        }
        UserToCourse[] memory temp = new UserToCourse[](counter);
        for (uint i = 0; i < userCourses.length; i++){
            if (userCourses[i].userId == msg.sender){
                temp[j] = userCourses[i];
                j++;
            }
        }
        return temp;
    }

    //course submission from user
    function submitCourse(uint _courseId, string memory _comment) public returns (bool){
        for (uint i = 0; i < userCourses.length; i++){
            if (userCourses[i].userId == msg.sender && _courseId == userCourses[i].courseId){
                userCourses[i].isSubmitted = true;
                userCourses[i].comment = _comment;
                _increaseUserBalance(20);
                return true;
            }
        }
        return false;
    }

    //общий список всех пользователей
    User[] public users;

    //become a member in user array
    function registrationOnEducationPlatform() public{
        users.push(User(msg.sender,0,false));
    }

    //increase user balance
    function _increaseUserBalance(uint _ammount) private{
        for (uint i = 0; i < users.length; i++){
            if (users[i].userId == msg.sender){
                users[i].balance += _ammount;
            }
        }
    }

    //become review
    function becomeRewier() public{
        for (uint i = 0; i < users.length; i++){
            if (users[i].userId == msg.sender){
                users[i].isRewier = true;
            }
        }
    }

    //get all courses for review for current user
    function getAvailForRewier() public view returns (UserToCourse[] memory){
        uint counter = 0;
        uint j = 0;
        for (uint i = 0; i < userCourses.length; i++){
            if (userCourses[i].userId != msg.sender && userCourses[i].isSubmitted == true && userCourses[i].isChecked == false){
                counter++;
            }
        }

        UserToCourse[] memory tempForReview = new UserToCourse[](counter);

        for (uint i = 0; i < userCourses.length; i++){
            if (userCourses[i].userId != msg.sender && userCourses[i].isSubmitted == true && userCourses[i].isChecked == false){
                tempForReview[j] = userCourses[i];
                j++;
            }
        }
        return tempForReview;
    }

    //set specific course as checked
    function setAsChecked(uint _courseId, address _userAddress, bool _result) public returns (bool){
        for (uint i = 0; i < userCourses.length; i++){
            if (userCourses[i].userId != msg.sender && userCourses[i].courseId == _courseId && userCourses[i].userId == _userAddress){
                userCourses[i].isChecked = _result;
                _increaseUserBalance(50);
            }
        }
        return true;
    }

    //get current user
    function getUser() public view returns (User memory){
        User memory temp; 
        for (uint i = 0; i < users.length; i++){
            if (users[i].userId == msg.sender){
                temp = users[i];
            }
        }
        return temp;
    }

    //array of all avaialiable courses 
    Course[] public courses;

    //feel courses list on the platform 
    function feelCourseList() public {
        courses.push(Course(1, "testName1", "testDescription1", 1, "someImage1"));
        courses.push(Course(2, "testName2", "testDescription2", 2, "someImage2"));
        courses.push(Course(3, "testName3", "testDescription3", 2, "someImage3"));
        courses.push(Course(4, "testName4", "testDescription4", 2, "someImage4"));
        courses.push(Course(5, "testName5", "testDescription5", 2, "someImage5"));
        courses.push(Course(6, "testName6", "testDescription6", 2, "someImage6"));
        courses.push(Course(7, "testName7", "testDescription7", 2, "someImage7"));
        courses.push(Course(8, "testName8", "testDescription8", 2, "someImage8"));
        courses.push(Course(9, "testName9", "testDescription9", 2, "someImage9"));
    }

    //length of platform courses
    function getCoursesLength() public view returns (uint){
        return courses.length;
    }

    //specific course on platform
    function getSpecificCourseById(uint _index) public view returns (Course memory){
        return courses[_index];
    }
}
