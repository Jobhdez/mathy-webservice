module Main where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import LinearAlgebra
import ArithTypeClass
import Matrix


main :: IO ()
main = hspec $ do
  describe "Linear Algebra" $ do
    it "test the determinant of the matrix" $ do
      determinant [[1,2,3], [45,60,33], [100,45,32]] `shouldBe` -7770

    it "test the trace of a square matrix" $ do
      trace [[2,1,5],[2,3,4],[0,1,0]] `shouldBe` 5

    it "test the uppertriangular of a square matrix" $ do
      upperTriangular  [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]] `shouldBe` [[1,2,3,4],[0,6,7,8],[0,0,11,12],[0,0,0,16]]

    it "test the lowertriangular of a square matrix" $ do
      lowerTriangular [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]] `shouldBe` [[1,0,0,0],[5,6,0,0],[9,10,11,0],[13,14,15,16]]

  describe "Matrix Arith" $ do
    it "test matrix addition" $ do
      add (Matrix [[3,4,5],[5,6,7]])  (Matrix [[1,2,3],[1,1,1]]) `shouldBe` (Matrix [[4,6,8],[6,7,8]])
      
    it "test matrix subtraction" $ do
      sub (Matrix [[3,4,5],[5,6,7]])  (Matrix [[1,2,3],[1,1,1]]) `shouldBe` (Matrix [[2,2,2],[4,5,6]])
      
    it "test matrix multplication" $ do
      mul (Matrix [[2,3,4],[4,5,6]]) (Matrix [[2,3],[4,5],[6,7]]) `shouldBe` (Matrix [[40,49],[64,79]])
      
    it "test power of matrix" $ do
      pow (Matrix [[2,3,4],[4,5,6]]) 3 `shouldBe` (Matrix [[8,27,64],[64,125,216]])
      
    it "test matrix exponential" $ do
      exponential (Matrix [[2,3,4],[4,5,6]]) `shouldBe` [[7.389056,20.085537,54.59815],[54.59815,148.41316,403.4288]]
      
    it "test matrix log" $ do
      matLog (Matrix [[2,3,4],[4,5,6]]) `shouldBe` [[0.6931472,1.0986123,1.3862944],[1.3862944,1.609438,1.7917595]]

