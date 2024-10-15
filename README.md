
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
  ![schema_general](https://github.com/user-attachments/assets/a182039f-5c33-4fde-bbb6-1f2f7f201dab)

### File Structure
<img src="https://github.com/user-attachments/assets/56f91558-f632-487f-9a9b-69971b00fcd6" width="150px"/>

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
    -   
### Compilation Procedure (Linux with ModelSim)

1.  **Ensure ModelSim is installed**:
    
    -   If not, follow the installation instructions for **ModelSim** on your Linux environment.
2.  **Edit the `compile_src.txt` file**:
    
    -   Locate the `compile_src.txt` file in the root directory of your project.
    -   Open it in a text editor (e.g., `nano`, `vim`, or `gedit`).
        
    -   Uncomment the line corresponding to the desired simulation by removing the `#` at the beginning of the line. This enables the correct source files for your simulation.
3.  **Run the compilation**:
    
    -   Navigate to the root directory of your project
        
    -   Run the following command to source the `compile_src.txt` script:
        
        ```sh
        source compile_src.txt
        ```
4.  **Launch ModelSim**:
    
    -   After running the script, **ModelSim** will automatically launch.
5.  **Start the simulation**:
    
    -   In ModelSim, use the GUI to run the simulation you have set up.
    -   Go to the `Wave` tab and display the desired signals by adding them to the wave viewer.
6.  **Analyze the results**:
    
    -   View the signal outputs in the **Wave** window to verify the simulation behavior of your ASCON modules.
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
  ![schema_general](https://github.com/user-attachments/assets/9e40e26a-ef42-4096-8eff-aabec7f8890a)

### Structure des fichiers
<img src="https://github.com/user-attachments/assets/56f91558-f632-487f-9a9b-69971b00fcd6" width="150px"/>

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


### Procédure de Compilation (Linux avec ModelSim)

1.  **Assurez-vous que ModelSim est installé** :
    
    -   Si ce n'est pas le cas, suivez les instructions d'installation de **ModelSim** sur votre environnement Linux.
2.  **Éditez le fichier `compile_src.txt`** :
    
    -   Localisez le fichier `compile_src.txt` dans le répertoire racine de votre projet.
        
    -   Ouvrez-le dans un éditeur de texte (par exemple, `nano`, `vim`, ou `gedit`).
        
    -   Décommentez la ligne correspondant à la simulation souhaitée en supprimant le `#` au début de la ligne. Cela permet d'activer les fichiers sources corrects pour votre simulation.
        
3.  **Lancez la compilation** :
    
    -   Placez-vous dans le répertoire racine de votre projet.
        
    -   Exécutez la commande suivante pour lancer le script `compile_src.txt` :
        
        ```sh  
        source compile_src.txt
        ```
        
4.  **Démarrez ModelSim** :
    
    -   Après avoir exécuté le script, **ModelSim** se lancera automatiquement.
5.  **Lancez la simulation** :
    
    -   Dans ModelSim, utilisez l'interface graphique pour lancer la simulation que vous avez configurée.
    -   Accédez à l'onglet `Wave` et affichez les signaux souhaités en les ajoutant dans la vue des ondes.
6.  **Analysez les résultats** :
    
    -   Visualisez les signaux de sortie dans la fenêtre **Wave** pour vérifier le comportement de simulation de vos modules ASCON.


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
