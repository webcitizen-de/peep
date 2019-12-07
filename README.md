# peep
**a super simple note management tool for the Bash command line**
<br />
<br />
## Introduction
If you just need a handy tool to manage your quick'n'dirty notes on the basis of simple text files right on the command line, then "peep" might be worth a glance. :)

### How to use
    Syntax: peep [ [e|edit] [d|delete] ] NOTENAME
            peep notes | [empty] trash | code

    Create a new note just type:  peep YOUR_NOTENAME
    Edit a existing file:         peep e YOUR_NOTENAME  OR  peep edit YOUR_NOTENAME
    List all available notes:     peep notes

    Move a note to the trash:     peep d YOUR_NOTENAME  OR  peep delete YOUR_NOTENAME
    Show the notes in trash:      peep trash
    Empty the trash:              peep empty trash

    Edit the source code of peep: peep code
