# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    dealer = @get('dealerHand')
    player = @get('playerHand')
    @get('dealerHand').on 'end', ->
      debugger
      alert(dealer.scores())
      alert(player.scores())

  # console.log @get 'dealerHand'
  # debugger


