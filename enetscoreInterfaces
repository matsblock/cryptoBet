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
      constructor () {
    }

    function scheduleAsString(address _address) external view returns (string memory) {
        return IEnetscore(_address).scheduleAsString();
    }

    function gameDetailsAsString(address _address) external view returns (string memory) {
        return IEnetscore(_address).gameDetailsAsString();
    }

    function callGameScoreAsString(address _address) external view returns (string memory) {
        return IEnetscore(_address).gameScoreAsString();
    }

    function requestSchedule(address _address, uint256 _leagueId, string memory _date) external{
        return IEnetscore(_address).requestSchedule(_leagueId, _date);
    }

    function requestGameDetails(address _address, uint256 _gameId) external{
        return IEnetscore(_address).requestGameDetails(_gameId);
    }

    function requestGameScore(address _address, uint256 _gameId) external{
        return IEnetscore(_address).requestGameScore(_gameId);
    }
}
