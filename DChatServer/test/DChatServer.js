
const { expect } = require("chai");

describe("DChatServer", function () 
{
    let deployer,user 
    let dchatserver

    beforeEach(async () => {
        [deployer, user] = await ethers.getSigners()
    
      
        const DChatServer = await ethers.getContractFactory("DChatServer")
        dchatserver = await DChatServer.deploy(dchatserver.address())
    
        
        const transaction = await dchatserver.connect(deployer).createServer("general")
        await transaction.wait()
      })
    
      describe("Deployment", function () 
      {
       
      })
    
  
});
