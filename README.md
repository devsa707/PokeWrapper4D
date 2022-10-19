<br/>
<div align="center">

![pokewrapper](https://user-images.githubusercontent.com/101226180/185762654-a153d56b-5646-4841-8fae-caeda22986ed.svg)

<br/>
</div>

A Wrapper for Poke API - [pokeapi.co](https://pokeapi.co).




How to use:

    
    Import the source files to your project or add in your IDE (Tools>Options>Language>Delphi>Library>LibraryPath)
    
    Example:
    
    var
      LPokemonEntity : TPokemonEntity;
    Begin
        LPokemonEntity := TPokemonEntity.create;
        TPokeFactory.New(TPokemon.Pokemon).GetAsEntity(LPokemonEntity,'bulbasaur');
        Writeln(LPokemonEntity.name);
    end;
    



![pokemon-birds](https://user-images.githubusercontent.com/101226180/185003860-b51fe5c4-fb12-420a-83b2-bbb894007da2.gif)

Dependencies: [delphimvcframework](https://github.com/danieleteti/delphimvcframework) 
