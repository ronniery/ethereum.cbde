// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {
    // Public to all, and a "getter" function is automatically created.
    int public x = 10;
    // Internal variable, that can be accessed by derived contracts
    int y = 20;

    /** 
     * To get internal variables you have to expose a way to do that, in a 
     * public manner. 
     * It can called from the same contract and also from external application.
     */
    function getY() public view returns (int) {
        return y;
    }

    /**
     * That private function, can only be called inside that contract
     */
    function f1() private view returns (int) {
        return x;
    }

    // A "public" function, calling a "private" function.
    function f2() public view returns (int) {
        return f1();
    }
    
    /** 
     * That kind of function, can be called within the contract and the 
     * contracts that derives from this one.
     */
    function f3() internal view returns (int) {
        return x;
    }

    /** 
     * As "external" it can only be called externally, and not internally.
     * External functions are better than "public" functions in terms of gas consumption.
     */
    function f4() external view returns (int) {
        return x;
    }

    function f5() public pure returns (int) {
        // return f4(); ERROR: Undeclared identifier, f4() is an external function.
    }
}

contract B is A {
    // That variable is initialized by the "f3" function, inherited from A contract.
    int public xx = f3();
    // int public yy = f1(); ERROR: f1() is private and cannot be called
}

// Contracts can call functions from another contracts.
contract C {
    A public contract_a = new A();
    int public xx = contract_a.f4(); // external calling
}