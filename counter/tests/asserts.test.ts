
import { describe, expect, it } from "vitest";
import { Cl } from '@stacks/transactions';


const accounts = simnet.getAccounts();
const address1 = accounts.get("wallet_1")!;

/*
  The test below is an example. To learn more, read the testing documentation here:
  https://docs.hiro.so/clarinet/feature-guides/test-contract-with-clarinet-sdk
  https://docs.hiro.so/clarinet/guides/test-contract-with-clarinet-sdk#custom-vitest-matchers
*/

describe("example tests", () => {
  it("ensures simnet is well initalised", () => {
    expect(simnet.blockHeight).toBeDefined();
  });

   it("Testing the Positive Scenario", () => {

    const functionResponse =  simnet.callPublicFn("asserts","assets-example",[Cl.bool(true)], address1);
    expect(functionResponse.result).toBeOk(Cl.stringAscii("end of the function"));
 
   });

   it("Testing the negative Scenario",()=>{
      const functionResponse = simnet.callPublicFn("asserts","assets-example", [Cl.bool(false)], address1);

      expect(functionResponse.result).toBeErr(Cl.stringAscii("Contract would fail and terminate with exception"));
   });
});