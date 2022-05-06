// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

// Declared outside of the contracts.
struct Instructor {
    uint age;
    string name;
    address addr;
}

contract Academy {
    enum State {
        Open, Closed, Unknown
    }

    State public academyState = State.Open;
    // You can use is a member type inside a contract
    Instructor public academyInstructor;

    constructor(uint _age, string memory _name) {
        academyInstructor.age = _age;
        academyInstructor.name = _name;
        academyInstructor.addr = msg.sender;
    }

    // Struct overriding 
    function changeInstructor(uint _age, string memory _name, address _addr) public {
        if(academyState == State.Open) {
            Instructor memory newInstructor = Instructor({ 
                age: _age, 
                name: _name, 
                addr: _addr 
            });

            academyInstructor = newInstructor;
        }
    }
}

contract School {
    // You can use is a member type inside a contract
    Instructor public schoolInstructor;
}