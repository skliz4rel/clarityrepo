
import { principal, uint } from "@stacks/transactions/dist/cl";
import { describe, expect, it } from "vitest";
import { Cl } from '@stacks/transactions';

const accounts = simnet.getAccounts();
const address1 = accounts.get("wallet_1")!;

/*
  The test below is an example. To learn more, read the testing documentation here:
  https://docs.hiro.so/clarinet/feature-guides/test-contract-with-clarinet-sdk
*/

describe("example tests", () => {
  it("ensures simnet is well initalised", () => {
    expect(simnet.blockHeight).toBeDefined();
  });

  it("test is-invalid-caller private method", ()=>{
    
    //const entry = simnet.getMapEntry("asserts1", "recipients",principal:Cl.uint(0));
    const isvalidResponse =simnet.callPrivateFn("asserts1","is-invalid-caller",[], address1);
    console.log(Cl.prettyPrint(isvalidResponse.result)); // (ok u2)

    expect(isvalidResponse.result).toBeBool(false);
  });

   it("add-recipient  public method", () => {
     const addRecipientResponse = simnet.callPublicFn("asserts1", "add-recipient", [Cl.principal(address1), Cl.uint(10)], address1);
      console.log("result that was recieved  "+Cl.prettyPrint(addRecipientResponse.result));
      console.log("sender address "+address1);

      expect(addRecipientResponse.result).toBeOk(Cl.bool(true));
   });

   it("delete-recipient  public method", () => {
    const deleteResponse = simnet.callPublicFn("asserts1", "delete-recipient", [Cl.principal(address1)], address1);
     console.log("response gotten after delete  "+Cl.prettyPrint(deleteResponse.result));
     console.log("sender address "+address1);

    // expect(deleteResponse.result).toBeOk(Cl.bool(true));

    expect(deleteResponse.result).toBeErr(Cl.uint(0))
  });


  // it("shows an example", () => {
  //   const { result } = simnet.callReadOnlyFn("counter", "get-counter", [], address1);
  //   expect(result).toBeUint(0);
  // });
});
