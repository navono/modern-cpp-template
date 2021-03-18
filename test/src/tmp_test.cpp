#include "demo/tmp.hpp"

#include <catch2/catch.hpp>

//TEST(TmpAddTest, CheckValues)
//{
//  ASSERT_EQ(tmp::add(1, 2), 3);
//  EXPECT_TRUE(true);
//}
//

TEST_CASE( "add of 1 and 2 is 3 (pass)", "[single-file]" ) {
  REQUIRE( tmp::add(1, 2) == 3 );
}
