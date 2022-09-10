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
        string submission;
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

    //get all my registered courses as a user
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

    // function _createZombie(string memory _name, uint _dna) private {
    //     uint id = zombies.push(Zombie(_name, _dna)) - 1;
    //     zombieToOwner[id] = msg.sender;
    //     ownerZombieCount[msg.sender]++;
    //     emit NewZombie(id, _name, _dna);
    // }

    //общий список всех пользователей
    User[] public users;

    //array of all avaialiable courses 
    Course[] public courses;

    /**
     * заполнение списка курсов 
     */
    function feelCourseList() public {
        courses.push(Course(1, "testName1", "testDescription1", 1, "someImage1"));
        courses.push(Course(2, "testName2", "testDescription2", 2, "someImage2"));
        courses.push(Course(3, "testName3", "testDescription3", 2, "someImage3"));
        courses.push(Course(4, "testName4", "testDescription4", 2, "someImage4"));
        courses.push(Course(5, "testName5", "testDescription5", 2, "someImage5"));
        courses.push(Course(6, "testName6", "testDescription6", 2, "someImage6"));
        courses.push(Course(7, "testName7", "testDescription7", 2, "someImage7"));
        courses.push(Course(8, "testName8", "testDescription8", 2, "someImage8"));
        courses.push(Course(8, "testName9", "testDescription9", 2, "someImage9"));
    }

    function getCoursesLength() public view returns (uint){
        return courses.length;
    }

    function getSpecificCourseById(uint _index) public view returns (Course memory){
        return courses[_index];
    }

    /**
     * регистрация юзера на курс
     */
    // function registrationToCourse(uint _courseId) public {
    //     User.courseIds.push(_courseId);
    // }

    /**
     * получение массива айди_курсов пользователя
     */
    // function getMyUserCourses() view public returns (uint){
    //     //вернуть список всех идентификатор пользака
    //     return userCourses[msg.sender];
    // }

    /**
     * function for reviewers
     * function check is there availiable courses for checking
     * return array of avaialible courses
     */

    // function recieveAvailCourses(address _chekerAddress) public {
    //     //логика получения доступных курсов для проверки
    //     return uint[];
    // }

    /**
     * function for reviewers
     * функция получает на вход курc_на_пользака и bool result
     * функция меняет статус курса на тру или false
     */

    // function courceCheck(uint _courseId, bool result) public returns (bool){
    //     //return bool result
    //     return result;
    // }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    // function retrieve() public view returns (uint256){
    //     return number;
    // }
    //декларируем тип ивента
    //event IntegersAdded(uint x, uint y, uint result);
    //эмитим ивент
    //emit IntegersAdded(_x, _y, result);

    // mapping (uint => address) public zombieToOwner;
    // mapping (address => uint) ownerZombieCount;


}
