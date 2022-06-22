pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;

    // ペットと飼い主を関連付ける
    function adopt(uint _petId) public returns (uint) {
        require(_petId >= 0 && _petId <= 15);

        // 関数を呼び出したユーザー、またはスマートコントラクトのアドレスを格納
        adopters[_petId] = msg.sender;

        return _petId;
    }

    // 飼い主を全て取得
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
