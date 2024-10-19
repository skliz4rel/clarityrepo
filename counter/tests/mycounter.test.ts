import { Cl } from '@stacks/transactions';
import { describe, expect, it } from "vitest";

const accounts = simnet.getAccounts();
const address1 = accounts.get("wallet_1")!;

/*
  The test below is an example. To learn more, read the testing documentation here:
  https://docs.hiro.so/clarinet/feature-guides/test-contract-with-clarinet-sdk
  https://docs.hiro.so/clarinet/guides/test-contract-with-clarinet-sdk
*/

describe("example tests", () => {
  it("ensures simnet is well initalised", () => {
    expect(simnet.blockHeight).toBeDefined();
  });

  /***The first two test are for increment function.  Test 1: Ensure that the count variable computes correctly
   * Test two ensure that the printed value from the increment function is valid.
   */

  it("increment public function test", ()=>{

    const incrementResponse = simnet.callPublicFn('mycounter', 'increment', [Cl.uint(1)], address1);
    console.log(Cl.prettyPrint(incrementResponse.result)); // (ok u2)
    expect(incrementResponse.result).toBeOk(Cl.uint(2));

    const count1 = simnet.getDataVar('mycounter', 'count');
    expect(count1).toBeUint(2);

    simnet.callPublicFn('mycounter', 'increment', [Cl.uint(40)], address1);
    const count2 = simnet.getDataVar('mycounter', 'count');
    expect(count2).toBeUint(42);

  });


  it("increment sends a print event", ()=>{

    const incrementResponse = simnet.callPublicFn('mycounter', 'increment', [Cl.uint(1)], address1);
    
    expect(incrementResponse.events).toHaveLength(1);
    const printEvent = incrementResponse.events[0];

    expect(printEvent.event).toBe('print_event');
    expect(printEvent.data.value).toBeTuple({
      object: Cl.stringAscii('count'),
      action: Cl.stringAscii('incremented'),
      value: Cl.uint(2)
    });

  });

  

/***************These two test below are for the decrement function.
 * Test1: Checks the decrement operation logic is correct.
 * Test 2: Checks that the decrement function prints the right values after execution.
 * *********************** */

 it("This test checks the decrement function for correct computation", ()=>{

  let count1 = simnet.getDataVar('mycounter', 'count');
  expect(count1).toBeUint(1);

  console.log("This is the result of printing count from decrement "+count1);

  const decrementResponse = simnet.callPublicFn('mycounter','decrement', [Cl.uint(1)], address1);
  console.log(Cl.prettyPrint(decrementResponse.result));
  expect(decrementResponse.result).toBeOk(Cl.uint(0));

  count1 =simnet.getDataVar('mycounter', 'count');
  expect(count1).toBeUint(0); //Since it was decremented 


 });

 it("This is going to test the print function for decrement", () => {
  const decrementResponse = simnet.callPublicFn('mycounter','decrement', [Cl.uint(1)], address1);

  expect(decrementResponse.events).toHaveLength(1);
  
  const printEvent =decrementResponse.events[0];

  expect(printEvent.event).toBe("print_event");
  
  expect(printEvent.data.value).toBeTuple({
    object: Cl.stringAscii("count"),
    action: Cl.stringAscii("decremented"),
    value: Cl.uint(0)
  });
});

   /*it("shows an example", () => {
     const { result } = simnet.callReadOnlyFn("counter", "get-counter", [], address1);
    expect(result).toBeUint(0);
   });*/
});
