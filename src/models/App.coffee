# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    dealer = @get('dealerHand')
    player = @get('playerHand')

    @get('playerHand').on 'end', ->
      debugger
      if (player)
        alert 'player loses'
      @initialize()



    @get('dealerHand').on 'end', ->
      #if dealer.scores()[1] > player.scores()[1]
      debugger

      if dealer.scores()[1] > player.scores()[1] && dealer.scores()[1] < 22
        alert 'dealer wins'

      else
        alert 'player wins'

      @initialize()



  # console.log @get 'dealerHand'
  # debugger


