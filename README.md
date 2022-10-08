# A&F

<p>
    <a href="https://github.com/antogno/af/blob/master/LICENSE"><img src="https://img.shields.io/github/license/antogno/af" alt="License"></a>
    <a href="https://github.com/antogno/af/commits"><img src="https://img.shields.io/github/last-commit/antogno/af" alt="Last commit"></a>
    <a href="https://github.com/antogno/af/releases/latest"><img src="https://img.shields.io/github/v/tag/antogno/af?label=last%20release" alt="Last release"></a>
</p>

A&F è un gestionale di automezzi e filiali di un'azienda. Questo progetto è stato realizzato come prova tecnica per conto di [Powering][1].

<p align="center">
    <img alt="A&F screenshot" src="https://raw.githubusercontent.com/antogno/af/master/assets/images/screenshot.png" style="border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.09) 0 3px 12px;">
</p>

---

## Indice

-   [Requisiti](#requisiti)
-   [Tecnologie utilizzate](#tecnologie-utilizzate)
-   [Installazione](#installazione)
-   [Licenza](#licenza)
-   [Link](#link)

## Requisiti

Realizzare un'applicazione web che gestisca gli automezzi e le filiali di un'azienda.

Ogni automezzo è caratterizzato da un codice, dalla targa, da marca e modello. Ogni filiale è caratterizzata da un codice, da un indirizzo, dalla città e dal CAP.

Di ogni automezzo si conosce la filiale, una filiale può ospitare più automezzi.

### Obiettivi della prova

-   Creazione del database, delle tabelle e dei vincoli interrelazionali;
-   Realizzare una pagina web che visualizzi la lista degli automezzi;
-   Realizzare una pagina web che visualizzi la lista delle filiali;
-   Realizzare una pagina web che visualizzi i dati di un automezzo;
-   Realizzare una pagina web che visualizzi i dati di una filiale;
-   Realizzare una pagina web per l'inserimento di un nuovo automezzo;
-   Realizzare una pagina web per l'inserimento di una nuova filiale;
-   Prevedere la possibilità di eliminare un automezzo o una filiale;
-   Realizzare un'interfaccia API REST che permetta di visualizzare la lista delle entità in formato JSON;
-   Effettuare una chiamata HTTP di tipo POST (URL: https://edoo.poweringsrl.it/exercises/Automezzo/upload.json) fornendo come body la lista
    degli automezzi in formato JSON;
-   Effettuare una chiamata HTTP di tipo POST (URL: https://edoo.poweringsrl.it/exercises/Filiale/upload.json) fornendo come body la lista delle filiali in formato JSON.

## Tecnologie utilizzate

A&F è Blogsonic è stato realizzato usando i seguenti strumenti e tecnologie:

-   Front-end:
    -   HTML (template engine: Smarty 4.2.1);
    -   CSS (framework: Bootstrap 5.2.2);
    -   JavaScript;
-   Back-end:
    -   PHP (framework: CodeIgniter 3.1.13);
    -   MySQL.

A&F esiste anche grazie a:

-   [Font Awesome 6.2.0][2].

## Installazione

Segui i passaggi seguenti per configurare A&F.

### Configura database

1. Crea un database e aggiungi le seguenti tabelle.

    Puoi trovare queste tabelle anche in `application/tables/`.

    ```sql
    CREATE TABLE `automezzo` (
        `codice` int NOT NULL AUTO_INCREMENT,
        `codice_filiale` int NOT NULL,
        `targa` varchar(7) NOT NULL,
        `marca` varchar(50) NOT NULL,
        `modello` varchar(50) NOT NULL,
        PRIMARY KEY (`codice`),
        CONSTRAINT `fk_filialeautomezzo` FOREIGN KEY (`codice_filiale`)
        REFERENCES `filiale`(`codice`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
    );
    ```

    ```sql
    CREATE TABLE `filiale` (
        `codice` int NOT NULL AUTO_INCREMENT,
        `indirizzo` varchar(50) NOT NULL,
        `citta` varchar(50) NOT NULL,
        `cap` varchar(5) NOT NULL,
        PRIMARY KEY (`codice`)
    );
    ```

2. Aggiungi le informazioni del database in `application/config/database.php`.

    ```php
    $db['default'] = array(
        'hostname' => '', // Hostname (es.: localhost)
        'username' => '', // Username (es.: root)
        'password' => '', // Password
        'database' => '' // Nome del database (es.: af)
    );
    ```

### Aggiungi l'URL di base e una chiave di crittografia in `application/config/config.php`

```php
$config['base_url'] = ''; // URL di base (e.g.: http://af.local/)

$config['encryption_key'] = ''; // Chiave di crittografia (e.g.: F7z4zM0L3ua6e9rdZgy0StgIYA8xIFai)
```

Per generare una chiave di crittografia, puoi andare su [RandomKeygen][3] e scorrere fino a "CodeIgniter Encryption Keys".

### Imposta l'ambiente corrente in `.htaccess`

```apache
SetEnv CI_ENV development
```

Le opzioni disponibili sono: `development`, `testing` e `production`. L'impostazione della costante su un valore di `development` farà sì che tutti gli errori PHP vengano visualizzati nel browser quando si verificano. Al contrario, l'impostazione della costante su `production` disabiliterà l'output di tutti gli errori.

## Licenza

A&F è concesso sotto i termini della licenza [Creative Commons Zero v1.0 Universal][4].

Per maggiori informazioni, visita il [sito web di Creative Commons][5].

## Link

-   [GitHub][6]
-   [LinkedIn][7]

[1]: https://www.poweringsrl.it/ 'Powering'
[2]: https://fontawesome.com/ 'Font Awesome'
[3]: https://randomkeygen.com/ 'RandomKeygen'
[4]: https://github.com/antogno/af/blob/master/LICENSE 'License'
[5]: https://creativecommons.org/publicdomain/zero/1.0/ 'Creative Commons'
[6]: https://github.com/antogno/blogsonic 'A&F - GitHub'
[7]: https://www.linkedin.com/in/antonio-granaldi/ 'Antonio Granaldi - Linkedin'
