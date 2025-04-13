
# Web3-App: AI-Supported Music Platform

## 1. Idea and Value


AI makes it possible to create music quickly using text prompts, even without musical experience. This project helps artists own and earn money from AI-generated music. The main idea is to support music creation with AI by using NFTs (ERC720 tokens) to prove ownership of each song.

Blockchain technology and DeFi make it easy to sell ownership. This platform will also help:

*   **Content Creators:**  They can buy "Copyright-NFTs" to legally use the songs in their content.
*   **Fans:**  They can get "Limited FAN-NFTs" that give them access to exclusive content related to the song or artist.

This app helps artists prove they own their AI-generated songs, since many copyright offices are currently refusing to do this (see: [Suno's help article](https://help.suno.com/en/articles/2746945)).

## 2. Requirements

### University Project Requirements

This application is being developed as a university project for the following courses:

1.  **Aktuelle Trends der Programmierung** (Current Trends in Programming) - Prof. Dr. Thomas Ströder
2.  **Project: WEB-App** - Prof. Dr. Christian Soltenborn

Both courses are at the "Fachhochschule der Wirtschaft" (FHDW) in Bergisch Gladbach, Germany. As such, the project must satisfy the following academic requirements:

*   **"Aktuelle Trends der Programmierung":** The smart contracts must be implemented using the Solidity programming language. The source code will be analyzed in a presentation to discuss the strengths and vulnerabilities of Solidity.
*   **"WEB-App":** The application must adhere to a client-server architecture.

### Technical Requirements

*   **Song Generation:** Integration with the Suno API to allow users to generate music.
*   **NFT Creation:** Functionality to mint NFTs associated with the generated songs.
*   **NFT Authentication:** A specific NFT type to unequivocally authenticate song ownership.
*   **Copyright-NFT:** An NFT type granting the holder the right to legally use the song in their content.
*   **Smart Contract Integration:** Use of smart contracts to store ownership details and NFT metadata. Owners of specific NFTs should be able to modify certain information within the smart contract (e.g., song metadata).
*   **TOP-Fan NFT:** An NFT tier specifically designed for top fans, providing exclusive access.
*   **Secret Content Access:** Functionality to grant access to exclusive content areas based on TOP-Fan NFT ownership.
*   **Secret Area Content:** The secret area could host content such as the official music video (MV) for the song.
*   **Song Listing:** A section to browse and discover available songs on the platform.
*   **User Profiles:** Dedicated user profile pages ("Section my profile").

**Nice-to-Have Features:**

*   NFT marketplace for buying and selling songs and Copyright NFTs.
*   AI-powered music video generation.
*   Song creation based on user-provided lyrics.
*   AI-generated artwork for NFTs.

**Non-Functional Requirements:**

*   **Theme:** Visual design following a modern "LED theme."
*   **Security:** Robust security measures to protect user data and smart contract integrity.

## 3. Description Context

This project focuses on demonstrating the potential of AI and blockchain technology within the music industry :D

## 4. Technology Stack (Preliminary)

The project is currently in the initial planning phase. The following are potential technology choices:

*   **Frontend:** React.js, Vue.js, or Next.js for the user interface.
*   **Backend:** Node.js with Express.js, or Python with Flask for the API.
*   **Data Storage:** An EVM-compatible blockchain such as Ethereum or BNB Chain for smart contract deployment and NFT management.

## 5. Team

No Team is needed. I'm an Einzelkämpfer.