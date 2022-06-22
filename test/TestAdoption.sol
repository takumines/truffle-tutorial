pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // テストを行うコントラクトを指定
    Adoption adoption = Adoption(DeployedAddresses.Adoption());
    // ペットIDを指定
    uint expectedPetId = 8;
    // 飼い主の指定
    address expectedAdopter = address(this);

    // adoptメソッドの引数に渡したペットIDが一致することをテスト
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    // ペットの飼い主が一致するかのテスト
    function testGetAdopterAddressByPetId() public {
        // ペットIDをもとに飼い主を指定
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        // 飼い主を全て取得
        // データを取得するだけなのでmemoryに格納
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}
