pragma solidity ^0.4.16;


contract Fibonacci {
	mapping (uint => uint) public memo;
	event FibCalculated(uint position, uint result);
	function calculate(uint position) returns (uint result) {
		/* Carry out calculations to find the nth Fibonacci number */
		if (position < 2)
			return position;
		else if (memo[position]!=0)
			return memo[position];
		else {
			result = calculate(position-1) + calculate(position-2);
			memo[position] = result;
			FibCalculated(position, result);
		}
	}

	/* Add a fallback function to prevent contract payability and non-existent function calls */
	function () {
		return;
	}

}

