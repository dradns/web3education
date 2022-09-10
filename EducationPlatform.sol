// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract EducationPlatform {

    struct Course {
        uint courseId;
        string name;
        string description;
        uint difficulty;
        string img;
    }

    struct User {
        address userId
        uint balance;
        bool isRewier;
    }

    struct UserToCourse {
        uint courseId;
        uint userId;
        bool isSubmitted;
        string submission;
        bool isChecked;
    }

    //адрес пользователя на его курс_айди
    mapping (address => uint) public userCourses;
    

    //общий список доступных курсов
    Course[] public courses;

    //общий список всех пользователей
    User[] public users;

    /**
     * заполнение списка курсов 
     */
    function feelCourseList() public {
        courses.push(Course(1, "testName1", "testDescription1", 1));
        courses.push(Course(2, "testName2", "testDescription2", 2));
        courses.push(Course(3, "testName2", "testDescription2", 2));
    }

    /**
     * регистрация юзера на курс
     */
    function registrationToCourse(uint _courseId) public {
        User.courseIds.push(_courseId);
    }

    /**
     * получение массива айди_курсов пользователя
     */
    function getMyUserCourses() view public returns (uint){
        //вернуть список всех идентификатор пользака
        return userCourses[msg.sender];
    }

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
    function courceCheck(uint _courseId, bool result) public returns (bool){
        //return bool result
        return result;
    }

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
}
