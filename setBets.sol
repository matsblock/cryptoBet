// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import 'https://github.com/matsblock/cryptoBet/blob/93fc2677d063d05042cc80133fea5528eeac011f/enetscoreInterfaces.sol';
import 'https://github.com/matsblock/cryptoBet/blob/338f2b3defa25aadbd723e1e966ecf999afc88c1/getMatchScoreAndWinner.sol';

contract setBets {

    address public admin;
    address tokenAddress = 0x218f6A24691fec031Fe53b62B0b98EDC395eE1f1;
    address enetScoreInterfacesAddress = 0x494b2216804965f8F5fF5033fb50C4cbA97935b2;
    enetscoreInterfaces enetscoreInterfacesContract  = enetscoreInterfaces(enetScoreInterfacesAddress);
    address getMatchScoreAndWinnerAddress = 0xC3831045efFAF09593666Ed3b4Cf3303a559cB70;
    getMatchScoreAndWinner getMatchScoreAndWinnerContract  = getMatchScoreAndWinner(getMatchScoreAndWinnerAddress);

 //   enum betOption {H,A,T}
//    enum status {pending, finished}
    struct bet {winnerResultEnum option;uint256 amount;}
    mapping(address => bet) public betBalances;
    uint public totalBetsToA;
    uint public totalBetsToB; 
    bet public winner; 
    string public gameDetailsString;
    string public gameScoreString;

    winnerResultEnum public matchWinner;
    string public matchStatus;

    string public quiengano;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, 'only admin');
        _;
    }

    function setBet(winnerResultEnum _bet, uint256 amount) public {
        
        IERC20(tokenAddress).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        betBalances[msg.sender].amount += amount;
        betBalances[msg.sender].option = _bet;
        if (_bet == winnerResultEnum.Home) {
            totalBetsToA += amount;
        }
        if (_bet == winnerResultEnum.Away) {
            totalBetsToB += amount;
        }
    }

    function withdrawBetRewards(
        uint amount)
        public {
        IERC20(tokenAddress).transfer(msg.sender, amount);
    }

    function setWinner(winnerResultEnum _winner) public {
        winner.option = _winner;
    }


    // function setScore() public {   
    //     getMatchScoreAndWinnerContract.getGameScoreAsString();
    // }


    function getMatchWinner() public {  
        matchWinner = getMatchScoreAndWinnerContract.getWinner();
    }
  
    function getWinnerPrint() public {  
        if (matchWinner == winnerResultEnum.Home) { 
            quiengano = "gano el local";
        } else if (matchWinner == winnerResultEnum.Away) { 
            quiengano = "gano el visitante";
        } else if (matchWinner == winnerResultEnum.Tied) { 
            quiengano = "empate";
        } 
    }

    function getMatchStatus() public {  
            matchStatus = getMatchScoreAndWinnerContract.status();
    }
    
    function claimRewards() public {
        uint rewards;
        if (matchWinner == betBalances[msg.sender].option){
            rewards = betBalances[msg.sender].amount * 2;
            withdrawBetRewards(rewards);
        }
    }
    
    function getlGameDetailsAsString() public {
         gameDetailsString = enetscoreInterfacesContract.gameDetailsAsString();
    }

     function  getGameScoreAsString() public {
          gameScoreString = enetscoreInterfacesContract.GameScoreAsString();
    }
}
