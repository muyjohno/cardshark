Cardshark
---

Query Netrunner cards in a ruby console.

Fire it up with `irb -r ./cardshark.rb` to get an interactive ruby session with the classes loaded.

Then make sure you do `Card.update!` to download card info. (You can rerun this to update when new cards are released.)

Then... you're on your own, sorry. But probably no one else will use this.

OK, try `Card.find('hedge')` or `Card.where(faction: :anarch)` to get your feet wet.
