class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  stand: ->

  dealerPlay: ->
    @at(0).flip()

    # if hasAce
    if @hasAce()
      # ace(11) && <= 17, hit
      while @scores()[1] <= 17
        @hit()
      if @scores()[1] > 21
      # ace(1) && <=16, hit
        while @scores()[0] <= 16
          @hit()
      # ace(1) && > 16, stand
        @scores()[1] = @scores()[0]

      @end()
    else
    # if !hasAce
      # no ace && < 17, hit
      while @scores()[1] < 17
        @hit()
      # no ace && => 17, stand
      @end()
    debugger

  end: ->
    @trigger('end', @)
    # ask player if he wants to start a new game

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0


  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]
#    @trigger('score', @)



    # while (no aces + (dealerHand.scores()[0] < 18)), hit
    #
    # else, compare dealer score with player score
