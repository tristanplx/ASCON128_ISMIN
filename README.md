
[English <img src="https://cdn-icons-png.flaticon.com/16/197/197374.png" width="16"/>](#english-version)  
[Français <img src="https://cdn-icons-png.flaticon.com/16/197/197560.png" width="16"/>](#version-fran%C3%A7aise)

# ASCON Encryption Project

<a name="english-version"></a>

## English Version

### Project Overview

This project implements a simplified version of the **ASCON128** encryption algorithm using **SystemVerilog**. ASCON is a lightweight cryptography algorithm, ideal for IoT and embedded systems. It ensures both message encryption and authentication, making it one of the most popular choices for secure communication in embedded applications.

### Key Concepts

-   **Encryption Algorithm**: ASCON operates on a 320-bit state composed of five 64-bit registers.
-   **Variables**: The input consists of:
    -   **IV** (Initialization Vector): 64 bits (0x80400C0600000000) to ensure unique encryption.
    -   **Key (K)**: 128-bit secret encryption key.
    -   **Nonce (N)**: 128-bit number to ensure encryption uniqueness.
    -   **Associated Data (A)**: Data that needs to be authenticated but not encrypted (48 bits).
    -   **Plaintext (P)**: Data to be encrypted (184 bits).
    -   **Ciphertext (C)**: Encrypted data (184 bits).
    -   **Tag (T)**: 128-bit tag for ensuring proper encryption.

### Implementation Overview

-   **Initialization Phase**: Concatenation of IV, Key, and Nonce followed by 12 permutations and XOR with the Key.
-   **Associated Data Phase**: XOR the associated data followed by 6 permutations.
-   **Plaintext Phase**: XOR the plaintext in 64-bit blocks with 6 permutations after each.
-   **Final Phase**: Obtain the tag by applying 12 permutations followed by XOR with the Key.

### Key Modules

1.  **Constant Addition**:
    -   Adds a constant using XOR on the third word of the state.
    -   Implemented in `add_const.sv`.
2.  **Substitution**:
    -   Substitutes 5-bit words from the state using an S-box.
    -   Implemented in `substitution.sv`.
3.  **Linear Diffusion**:
    -   Applies circular shifts and XOR operations on the 64-bit lines of the state.
    -   Implemented in `diffusion.sv`.

### Areas for Improvement

While each module (Constant Addition, Substitution, and Linear Diffusion) functions correctly based on individual testing and verification, the **Top Level** implementation is still missing some key components for complete functionality:

-   **Top Level Logic**: The modules are not yet integrated into a fully functioning top-level design. Specifically, the control logic to synchronize the phases (initialization, associated data, plaintext, and finalization) is not complete.
-   **State Machine**: A comprehensive Moore State Machine is required to manage the transitions between different phases of the encryption process, ensuring correct timing and control signal generation.
-   **Testbenches**: Although individual module testbenches are functional, a comprehensive testbench for the entire ASCON system is still to be developed.

These points highlight the improvements needed for a complete and functional ASCON encryption processor.

----------

<a name="version-française"></a>

## Version Française

### Aperçu du Projet

Ce projet implémente une version simplifiée de l’algorithme de chiffrement **ASCON128** en utilisant **SystemVerilog**. ASCON est un algorithme de cryptographie légère, idéal pour les systèmes IoT et embarqués. Il garantit à la fois le chiffrement et l'authentification des messages, ce qui en fait un choix populaire pour la communication sécurisée dans les systèmes embarqués.

### Concepts Clés

-   **Algorithme de Chiffrement** : ASCON fonctionne sur un état de 320 bits composé de cinq registres de 64 bits.
-   **Variables** : Les entrées de l’algorithme sont :
    -   **IV** (Vecteur d'initialisation) : 64 bits (0x80400C0600000000) pour garantir un chiffrement unique.
    -   **Clé (K)** : Clé secrète de chiffrement de 128 bits.
    -   **Nonce (N)** : Nombre arbitraire de 128 bits pour garantir l’unicité du chiffrement.
    -   **Données Associées (A)** : Données à authentifier mais non chiffrées (48 bits).
    -   **Texte Clair (P)** : Données à chiffrer (184 bits).
    -   **Texte Chiffré (C)** : Données chiffrées (184 bits).
    -   **Tag (T)** : Tag de 128 bits pour assurer le bon chiffrement.

### Vue d'Ensemble de l'Implémentation

-   **Phase d'Initialisation** : Concatenation de l'IV, de la clé et du nonce, suivie de 12 permutations et d’un XOR avec la clé.
-   **Phase de Données Associées** : Injection des données associées via XOR et 6 permutations.
-   **Phase de Texte Clair** : Injection du texte clair en blocs de 64 bits suivie de 6 permutations après chaque bloc.
-   **Phase Finale** : Récupération du tag avec 12 permutations et un XOR avec la clé.

### Modules Clés

1.  **Addition de Constante** :
    
    -   Effectue un XOR sur le troisième mot de l'état avec une constante.
    -   Implémenté dans `add_const.sv`.
2.  **Substitution** :
    
    -   Remplace des mots de 5 bits dans l'état à l'aide d'une S-box.
    -   Implémenté dans `substitution.sv`.
3.  **Diffusion Linéaire** :
    
    -   Applique des décalages circulaires et des opérations XOR sur les lignes de 64 bits de l'état.
    -   Implémenté dans `diffusion.sv`.

### Points d'Amélioration

Bien que chaque module (Addition de Constante, Substitution, Diffusion Linéaire) fonctionne correctement, la mise en œuvre du **Top Level** n'est pas encore complète :

-   **Logique du Top Level** : Les modules ne sont pas encore intégrés dans une conception complète de niveau supérieur. En particulier, la logique de contrôle pour synchroniser les phases (initialisation, données associées, texte clair, et finalisation) est incomplète.
-   **Machine d'État** : Une machine d'état de type Moore doit être implémentée pour gérer les transitions entre les différentes phases du processus de chiffrement et garantir la bonne génération des signaux de contrôle.
-   **Testbenches** : Bien que les testbenches des modules individuels fonctionnent, un testbench global pour l’ensemble du système ASCON reste à développer.

Ces points mettent en avant les améliorations nécessaires pour un processeur ASCON complet et fonctionnel.

----------

## Auteurs

Projet scolaire pour l'École des Mines de Saint-Étienne.  
[Tristan Panhelleux](https://github.com/tristanplx)
