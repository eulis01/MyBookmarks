# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project -- This checked in by default using the `rails new` command.
- [x] Include at least one has_many relationship -- User has many bookmarks, and Bookmark has many tags.
- [x] Include at least one belongs_to relationship -- Bookmark belongs to user, and Tag belongs to user.

- [x] Include at least two has_many through relationships -- 
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [x] Include signup -- User controller handles the signup via users/signup and users/create Route usind POST OR GET Request.
- [x] Include login -- User can login with email and password as a regular non omniauth user.
- [x] Include logout -- The session controller handles the logout via the session/destroy route.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) -- Using omniauth-github for One click singup.
- [x] Include nested resource show or index -- nested via users/:user_id/bookmarks and displayed on the user show page listing all the current user created bookmarks.

- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate