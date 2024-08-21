async function main() {
    // Your contract name
    const Token = await ethers.getContractFactory("ReedToken");
    const tokenCap = 100000000;
    const tokenBlockReward = 50;
  
    const token = await Token.deploy(tokenCap, tokenBlockReward);
  
    await token.deployed();
  
    console.log("Token deployed to:", token.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });
  