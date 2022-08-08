const ethers = require("ethers");
const fs = require("fs-extra");

async function main() {

//http://127.0.0.1:7545

const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:7545");
const wallet = new ethers.Wallet(
    "d4f5b846790f8116f6f4cc37f197ce2248021e7452292cbf7c8ccfd41a60eb68", 
    provider
  );
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
  const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", 
  "utf8"
  );
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  console.log("Deploying, please wait...");
  const contract = await contractFactory.deploy(); //STOP here! Wait for contract to deploy
  console.log(contract);
}
main()
.then(() => process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
});