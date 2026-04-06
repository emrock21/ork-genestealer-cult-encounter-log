// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Genestealer Cult Encounter Log
/// @notice Records Ork encounters with Genestealer Cult cells and hybrid activity.
/// @dev Unique to Cults due to broodmind signals and hybrid infiltration fields.

contract GenestealerCultEncounterLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string cultCell;        // Name or type of cult cell (Four-Armed, Rusted Claw, etc.)
        string hybridType;      // Hybrid generation (Acolyte, Neophyte, Aberrant, etc.)
        string broodmindShift;  // Psychic or behavioral signal detected
        string battleSummary;   // One-line Ork-style summary of battle + result
        address creator;
        uint256 approved;
        uint256 rejected;
        uint256 createdAt;
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string cultCell, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                cultCell: "Example Cult Cell (Fill your own below)",
                hybridType: "Example hybrid",
                broodmindShift: "Example broodmind signal",
                battleSummary: "Example battle summary.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata cultCell,
        string calldata hybridType,
        string calldata broodmindShift,
        string calldata battleSummary
    ) external {
        require(bytes(cultCell).length > 0, "Cult cell required");

        logs.push(
            Encounter({
                cultCell: cultCell,
                hybridType: hybridType,
                broodmindShift: broodmindShift,
                battleSummary: battleSummary,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, cultCell, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
