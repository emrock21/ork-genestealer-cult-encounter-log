# Ork Genestealer Cult Encounter Log

On-chain Ork reports of Genestealer Cult activity.  
Each entry records:

- Cult cell  
- Hybrid type  
- Broodmind signal  
- One-line Ork-style battle summary  

Exclusive to Genestealer Cults due to infiltration tactics, psychic signals, and hybrid generations.

---

## Contract

Deployed on Base:  
`0x9b0A7F92c287908E8BfD41E8F7C9F9685C86fD69`  
https://basescan.org/address/0x9b0a7f92c287908e8bfd41e8f7c9f9685c86fd69#code

Main file: `contracts/GenestealerCultEncounterLog.sol`

---

## Example encounter

```solidity
recordEncounter(
  "Rusted Claw",
  "Neophyte Hybrid",
  "Coordinated ambush",
  "Da cultists popped outta da junk piles, an' da boyz ran when da ground started explodin'."
);

Voting
voteEncounter(1, true);
voteEncounter(1, false);

---

## Conclusion

This contract provides a simple on-chain record of Ork encounters with Genestealer Cult cells.  
Each entry captures infiltration patterns, hybrid activity, broodmind signals, and the Ork perspective of how the fight ended.  
Voting allows the community to validate which encounters feel accurate, funny, or lore‑consistent.
