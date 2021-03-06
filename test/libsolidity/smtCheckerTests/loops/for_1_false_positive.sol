pragma experimental SMTChecker;

contract C
{
	function f(uint x) public pure {
		require(x < 100);
		for(uint i = 0; i < 10; ++i) {
			// Overflows due to resetting x.
			x = x + 1;
		}
		// Assertion is safe but current solver version cannot solve it.
		// Keep test for next solver release.
		assert(x > 0);
	}
}
// ====
// SMTSolvers: cvc4
// ----
// Warning 2661: (176-181): Overflow (resulting value larger than 2**256 - 1) happens here
// Warning 4661: (296-309): Assertion violation happens here
