
const hre = require("hardhat");

async function main() {


  const Attendance = await hre.ethers.getContractFactory("Attendance");
  const attendance = await Attendance.deploy();

  await attendance.deployed();

  console.log(
    ` deployed to ${attendance.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
