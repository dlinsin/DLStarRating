class RatingScreen extends Screen
  anchor: -> view
  
  constructor: ->
    super 'Rating'
    
    extend @elements,
    'First Rating, 1st star' : -> view.buttons()[0],
    'First Rating, 3rd star' : -> view.buttons()[2],
    'Second Rating, 3rd star' : -> view.buttons()[7],
    'Second Rating, 1st star' : -> view.buttons()[5],
    'Third Rating, 5th star' : -> view.buttons()[12],
    'Third Rating, 4th star' : -> view.buttons()[11]
    
    extend @actions,
    'Rate first rating': ->
      view.buttons()[2].tap()
      
    'Rate second rating': ->
      view.buttons()[5].tap()
      
    'Rate third rating': ->
      view.buttons()[11].tap()