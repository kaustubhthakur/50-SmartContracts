const { expect } = require("chai")

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe("Dchannels", function () {
  let deployer, user
  let dchannels

  const NAME = "DChannel"
  const SYMBOL = "DC"

  beforeEach(async () => {
    [deployer, user] = await ethers.getSigners()

  
    const Dchannels = await ethers.getContractFactory("Dchannels")
    dchannels = await Dchannels.deploy(NAME, SYMBOL)

    
    const transaction = await dchannels.connect(deployer).createServer("general", tokens(1))
    await transaction.wait()
  })

  describe("Deployment", function () {
    it("Sets the name", async () => {
      const result = await dchannels.name()
      expect(result).to.equal(NAME)
    })
  })

})