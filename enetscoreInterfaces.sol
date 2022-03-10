// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

interface IEnetscore {
    function scheduleAsString() external view returns (string memory);
    function gameDetailsAsString() external view returns (string memory);
    function gameScoreAsString() external view returns (string memory);
    function requestSchedule(uint256, string memory) external;
    function requestGameDetails(uint256) external;
    function requestGameScore(uint256) external;
}

contract enetscoreInterfaces {

    address public enetscore_address;

    constructor () {
      enetscore_address = 0x3C36cD60da07C7792C00D20a28274A451e47cb32;
    }

    function scheduleAsString() external view returns (string memory) {
        return IEnetscore(enetscore_address).scheduleAsString();
    }

    function gameDetailsAsString() external view returns (string memory) {
        return IEnetscore(enetscore_address).gameDetailsAsString();
    }

    function callGameScoreAsString() external view returns (string memory) {
        return IEnetscore(enetscore_address).gameScoreAsString();
    }

    function requestSchedule(uint256 _leagueId, string memory _date) external{
        return IEnetscore(enetscore_address).requestSchedule(_leagueId, _date);
    }

    function requestGameDetails(uint256 _gameId) external{
        return IEnetscore(enetscore_address).requestGameDetails(_gameId);
    }

    function requestGameScore(uint256 _gameId) external{
        return IEnetscore(enetscore_address).requestGameScore(_gameId);
    }
}
