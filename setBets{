// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract setBets{

    address public admin;
    address tokenAddress = 0x6d9308659AcF248a05501b1A49540522eB8A72FE;
    enum betOption {A,B}
    enum status {pending, finished}
    struct bet {betOption option;uint256 amount;}
    mapping(address => bet) public betBalances;
    uint public totalBetsToA;
    uint public totalBetsToB; 
    bet public winner; 

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, 'only admin');
        _;
    }

    function setBet(betOption _bet, uint256 amount) public {
        
        IERC20(tokenAddress).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        betBalances[msg.sender].amount += amount;
        betBalances[msg.sender].option = _bet;
        if (_bet == betOption.A) {
            totalBetsToA += amount;
        }
        if (_bet == betOption.B) {
            totalBetsToB += amount;
        }
    }

    function withdrawBetRewards(
        uint amount)
        public {
        IERC20(tokenAddress).transfer(msg.sender, amount);
    }

    function setWinner(betOption _winner) public {
        winner.option = _winner;
    }
    
    function claimRewards() public {
        uint rewards;
        if (winner.option == betBalances[msg.sender].option){
            rewards = betBalances[msg.sender].amount * 2;
            withdrawBetRewards(rewards);
        }
    }
}

