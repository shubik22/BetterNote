User.create({
  username: "Aiden",
  email: "demo@betternote.us",
  password: "password"
})

demo = User.all.first

demo.notebooks.create({
  name: "Personal Stuff"
})

personal_notebook = demo.notebooks.last

demo.notebooks.create({
  name: "Recipes"
})

recipe_notebook = demo.notebooks.last

demo.notebooks.create({
  name: "Cool Quotes"
})

quote_notebook = demo.notebooks.last

demo.notebooks.create({
  name: "Gift ideas"
})

gift_notebook = demo.notebooks.last

demo.tags.create({
  name: "Important"
})

important_tag = demo.tags.last

demo.tags.create({
  name: "Stuff to do this summer"
})

summer_tag = demo.tags.last

demo.tags.create({
  name: "Possible Tattoos"
})

tattoo_tag = demo.tags.last

demo.tags.create({
  name: "Books/movies/music"
})

bmm_tag = demo.tags.last

demo.tags.create({
  name: "Fav foods (yummm)"
})

food_tag = demo.tags.last

demo.notes.create({
  title: "Baked Falafel with Tahini Sauce",
  body: "Yield: 8 servings
Time: 45 minutes, plus up to 24 hours to soak chickpeas

1¾ cups dried chickpeas
2 garlic cloves, chopped
1 small onion, quartered
1 tablespoon cumin
Scant teaspoon cayenne, or to taste
1 cup chopped fresh parsley or cilantro
1½ teaspoons salt, plus more to taste
½ teaspoon black pepper, plus more to taste
½ teaspoon baking soda
1 tablespoon fresh lemon juice
4 tablespoons olive oil
½ cup tahini

1. Put the chickpeas in a large bowl and cover with water by 3 or 4 inches-the beans will triple in volume as they soak. Soak for 12 to 24 hours, checking once or twice to see if you need to add more water to keep the beans submerged. (If the soaking time is inconvenient for you, just leave them in the water until they’re ready; you should be able to break them apart between your fingers.)

2. Heat the oven to 375°F. Drain the chickpeas and transfer them to a food processor with the garlic, onion, cumin, cayenne, herb, 1 teaspoon of salt, pepper, baking soda, and lemon juice. Pulse until everything is minced but not pureed, stopping the machine and scraping down the sides if necessary; add water tablespoon by tablespoon if necessary to allow the machine to do its work, but keep the mixture as dry as possible. Taste and adjust the seasoning, adding more salt, pepper, or cayenne as needed.

3. Grease a large rimmed baking sheet with 2 tablespoons of the oil. Roll the bean mixture into 20 balls, about 1½ inches each, then flatten them into thick patties. Put the falafel on the prepared pan and brush the tops with the remaining 2 tablespoons oil. Bake until golden all over, 10 to 15 minutes on each side.

4. Meanwhile, whisk the tahini and remaining salt with ½ cup water in a small bowl until smooth. Taste and adjust the seasoning and serve the falafel drizzled with the sauce.

Source: Mark Bittman",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: food_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Delicious Ham and Potato Soup",
  body: "Prep Time: 20 Minutes
Cook Time: 25 Minutes
Ready In: 45 Minutes
Servings: 8

Ingredients:
3 1/2 cups peeled and diced potatoes
1/3 cup diced celery
1/3 cup finely chopped onion
3/4 cup diced cooked ham
3 1/4 cups water
2 tablespoons chicken bouillon granules
1/2 teaspoon salt, or to taste
1 teaspoon ground white or black pepper, or to taste
5 tablespoons butter
5 tablespoons all-purpose flour
2 cups milk

Directions:
1.	Combine the potatoes, celery, onion, ham and water in a stockpot. Bring to a boil, then cook over medium heat until potatoes are tender, about 10 to 15 minutes. Stir in the chicken bouillon, salt and pepper.
2.	In a separate saucepan, melt butter over medium-low heat. Whisk in flour with a fork, and cook, stirring constantly until thick, about 1 minute. Slowly stir in milk as not to allow lumps to form until all of the milk has been added. Continue stirring over medium-low heat until thick, 4 to 5 minutes.
3.	Stir the milk mixture into the stockpot, and cook soup until heated through. Serve immediately.

Source: Allrecipes.com",
  notebook_id: recipe_notebook.id
})

demo.notes.create({
  title: "Good Old Fashioned Pancakes",
  body: "Ingredients:
1 1/2 cups all-purpose flour
3 1/2 teaspoons baking powder
1 teaspoon salt
1 tablespoon white sugar
1 1/4 cups milk
1 egg
3 tablespoons butter, melted

Directions:
1.	In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.
2.	Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.

Source: Allrecipes.com",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: food_tag.id
})

demo.notes.create({
  title: "Grandma's Apple Pie",
  body: "Ingredients:
1 recipe pastry for a 9 inch double crust pie
1/2 cup unsalted butter
3 tablespoons all-purpose flour
1/4 cup water
1/2 cup white sugar
1/2 cup packed brown sugar
8 Granny Smith apples - peeled, cored and sliced

Directions:
1.	Preheat oven to 425 degrees F (220 degrees C). Melt the butter in a saucepan. Stir in flour to form a paste. Add water, white sugar and brown sugar, and bring to a boil. Reduce temperature and let simmer.
2.	Place the bottom crust in your pan. Fill with apples, mounded slightly. Cover with a lattice work crust. Gently pour the sugar and butter liquid over the crust. Pour slowly so that it does not run off.
3.	Bake 15 minutes in the preheated oven. Reduce the temperature to 350 degrees F (175 degrees C). Continue baking for 35 to 45 minutes, until apples are soft.

Source: Allrecipes.com",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: food_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
})

demo.notes.create({
  title: "New Year's Resolutions",
  body: "1.  Eat better
2.  Friend a person with the same name as me on Facebook
3.  Reread a book from high school
4.  Use more double-sided tape
5.  Give more compliments
6.  Be more understanding
7.  Get my mile time under 5:30
8.  Buy a tandem bike

Accomplished resolutions:

Send a two-page handwritten letter to a friend
Visit Yellowstone
Wes Anderson movie marathon
Clone Evernote",
  notebook_id: personal_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.create({
  title: "Bossypants Excerpt: Tina Fey Response to Internet Troll",
  body: "From Dlisted.com

Posted by Centaurious on Monday, 21/9/2009, 2.08 am
Tina Fey is an ugly, pear-shaped, bitchy, overrated troll

Dear Centaurious,

First let me say how inspiring it is that you have learned to use a computer.

I hate for our correspondence to be confrontational, but you have offended me deeply. To say I'm an overrated troll, when you have never even seen me guard a bridge, is patently unfair. I'll leave it for others to say if I'm the best, but I am certainly one of the most dedicated trolls guarding bridges today. I always ask three questions, at least two of which are riddles.

As for 'ugly, pear-shaped and bitchy'? I prefer the terms 'offbeat, business class–assed and exhausted', but I'll take what I can get. There's no such thing as bad press!

Now go to bed, you crazy night owl! You have to be at Nasa early in the morning. So they can look for your penis with the Hubble telescope.

Affectionately,
Tina

Source: Bossypants",
  notebook_id: quote_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Boilermaker Tailgate Chili",
  body: "Ingredients:
2 pounds ground beef chuck
1 pound bulk Italian sausage
3 (15 ounce) cans chili beans, drained
1 (15 ounce) can chili beans in spicy sauce
2 (28 ounce) cans diced tomatoes with juice
1 (6 ounce) can tomato paste
1 large yellow onion, chopped
3 stalks celery, chopped
1 green bell pepper, seeded and chopped
1 red bell pepper, seeded and chopped
2 green chile peppers, seeded and chopped
1 tablespoon bacon bits
4 cubes beef bouillon
1/2 cup beer
1/4 cup chili powder
1 tablespoon Worcestershire sauce
1 tablespoon minced garlic
1 tablespoon dried oregano
2 teaspoons ground cumin
2 teaspoons hot pepper sauce
1 teaspoon dried basil
1 teaspoon salt
1 teaspoon ground black pepper
1 teaspoon cayenne pepper
1 teaspoon paprika
1 teaspoon white sugar
1 (8 ounce) package shredded Cheddar cheese

Directions:
1.	Heat a large stock pot over medium-high heat. Crumble the ground chuck and sausage into the hot pan, and cook until evenly browned. Drain off excess grease.
2.	Pour in the chili beans, spicy chili beans, diced tomatoes and tomato paste. Add the onion, celery, green and red bell peppers, chile peppers, bacon bits, bouillon, and beer. Season with chili powder, Worcestershire sauce, garlic, oregano, cumin, hot pepper sauce, basil, salt, pepper, cayenne, paprika, and sugar. Stir to blend, then cover and simmer over low heat for at least 2 hours, stirring occasionally.
3.	After 2 hours, taste, and adjust salt, pepper, and chili powder if necessary. The longer the chili simmers, the better it will taste. Remove from heat and serve, or refrigerate, and serve the next day.

Source: Allrecipes.com",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: food_tag.id
})

demo.notes.create({
  title: "Favorite Quotes",
  body: "'If you want to know what a man's like, take a good look at how he treats his inferiors, not his equals.'
- J.K. Rowling, Harry Potter and the Goblet of Fire
  
'I love deadlines. I love the whooshing noise they make as they go by.'
- Douglas Adams, The Salmon of Doubt

'If you can't explain it to a six year old, you don't understand it yourself.'
- Albert Einstein

'You can never be overdressed or overeducated.'
- Oscar Wilde
  
'Do I contradict myself? 
Very well then I contradict myself, 
(I am large, I contain multitudes.)'
- Walt Whitman, Song of Myself


Source: Goodreads.com",
  notebook_id: quote_notebook.id
})

demo.notes.create({
  title: "Zesty Slow Cooker Chicken Barbecue",
  body: "Ingredients:
6 frozen skinless, boneless chicken
breast halves
1 (12 ounce) bottle barbeque sauce
1/2 cup Italian salad dressing
1/4 cup brown sugar
2 tablespoons Worcestershire sauce

Directions:
1.	Place chicken in a slow cooker. In a bowl, mix the barbecue sauce, Italian salad dressing, brown sugar, and Worcestershire sauce. Pour over the chicken.
2.	Cover, and cook 3 to 4 hours on High or 6 to 8 hours on Low.

Source: Allrecipes.com",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: food_tag.id
})

demo.notes.create({
  title: "Simplest and Best Shrimp Dish",
  body: "Yield: 4 servings
Time: About 30 minutes

1/3 cup extra virgin olive oil, or more as needed
3 or 4 big cloves garlic, cut into slivers
About 11/2 pounds shrimp, 20 to 30 per pound, peeled, rinsed, and dried
Salt and freshly ground black pepper
1 teaspoon ground cumin
11/2 teaspoons hot paprika
Chopped fresh parsley leaves for garnish
Warm the olive oil in a large, broad ovenproof skillet or heatproof baking pan over low heat. There should be enough olive oil to cover the bottom of the pan; don’t skimp. Add the garlic and cook until it turns golden, a few minutes.
Raise the heat to medium-high and add the shrimp, some salt and pepper, the cumin, and the paprika. Stir to blend and continue to cook, shaking the pan once or twice and turning the shrimp once or twice, until they are pink all over and the mixture is bubbly, 5 to 10 minutes. Garnish and serve immediately.

Source: Mark Bittman",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Pan-Cooked Salmon Fillets with Lentils",
  body: "Yield: 4 servings
Time: About 1 hour

2 to 3 cups dried green lentils, washed and picked over
2 medium carrots, cut into 1/4-inch cubes
1 small potato, peeled and cut into 1/4-inch cubes
1 medium onion, chopped
2 cloves garlic, minced
A few sprigs each fresh parsley and thyme, a bay leaf, and a few chives, tied in cheesecloth for easy removal, or about 11/2 teaspoons mixed dried herbs
Salt and freshly ground black pepper
2 tablespoons extra virgin olive oil
Four 6-ounce salmon fillets
Chopped fresh parsley leaves or chives for garnish

Put the lentils in a large, deep saucepan with water to cover. Cook over medium heat, stirring occasionally, until they begin to soften, 15 to 20 minutes, then add the carrots, potato, onion, garlic, and herbs.
Continue to cook, adding just enough water if necessary to keep the beans moist, until the lentils and vegetables are tender, 35 to 45 minutes total. Remove the fresh herbs, sprinkle with salt and pepper, add the olive oil, and keep warm.
Heat a large skillet, preferably cast-iron, over high heat for about 5 minutes. Sprinkle the bottom of the skillet with salt, then add the salmon, skin side down. Cook over high heat until well browned on the bottom, about 5 minutes. Flip the salmon and cook for 1 minute longer (more if you like your salmon well done). Put about 1 cup of lentils in the center of each of 4 serving plates and top with a salmon fillet. Garnish with parsley and serve.

Source: Mark Bittman",
  notebook_id: recipe_notebook.id
})

demo.notes.create({
  title: "Braised Beef Short Ribs",
  body: "Ingredients:
12 beef short ribs, bone-in
Salt and freshly ground pepper
1/4 cup grapeseed oil or olive oil
1 yellow onion, peeled and chopped
1 stalk celery, chopped
1 carrot, peeled and chopped
1 750-ml bottle good dry red wine (we used a zinfandel)
6 cups veal stock (can substitute beef stock)

Directions:
1 Preheat oven to 350°F. Season ribs to taste with the salt and pepper. Heat oil in a large, heavy bottomed ovenproof pan over high heat. Add ribs and brown on all sides. Work in batches if you need to so that the ribs don't get crowded (this will help with browning).

2 Transfer ribs to a plate. Pour off excess fat. Add the onions, celery, and carrots to the pan and sauté, stirring often, until lightly browned, about 5 minutes. Remove the vegetables from the pan, set aside. Then add the wine to the pan, deglazing the pan, scraping off any browned bits from the bottom of the pan. Reduce the wine by three-quarters until thick and slightly syrupy, about 15 minutes.

3 Return the ribs to the pan, add the veal stock and enough water to cover the ribs. Bring to a boil, cover with foil, and place in the oven. Braise, cooking in the oven, until the meat is fork-tender, 2 to 2 1/2 hours. During the last 1/2 hour of cooking, add back in the vegetables. Allow the ribs to cool in the liquid, then cover and refrigerate overnight.

4 The next day, remove the excess fat that has solidified at the top from the overnight chilling. Place the pan with the ribs and cooking liquid over medium heat, uncovered. Cook until the liquid has reduced by three-quarters, about 1 hour. Continue to cook, spooning the sauce over the ribs, until the sauce is thick and ribs are glazed. Take care not to burn the glaze; move the ribs around in the pan to keep them from burning.

Serve over mashed potatoes, egg noodles, or rice.

Source: SimplyRecipes.com",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: food_tag.id
})

demo.notes.create({
  title: "Songs I should download",
  body: "-- Drunk in Love, Beyonce
-- that really catchy (but kind of annoying) Pharrell song
-- Fare Thee Well by Oscar Isaac (Inside Llewyn Davis soundtrack)
-- January Wedding by the Avett Brothers
-- Cocoa Butter Kisses by Chance the Rapper
-- Don't Wait by Mapei
-- that Chet Faker song (look up title)
-- Appalachian Spring, Aaron Copland
-- Most popular Foxygen songs
-- Art of Peer Pressure, Kendrick
-- Imagine Dragons/Kendrick Lamar mashup from the Grammys",
  notebook_id: personal_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.create({
  title: "Todo List re: Sparky",
  body: "Weekly Sparky photoshoot (post photos to Sparky's FB after)
Cut/file sparky's nails (every two weeks)
Bake Sparky's doggy treats (look up new recipe--seems like he's not crazy about the current one)
Look up new cat videos to buy for Sparky on Amazon
Walk Sparky (morning and evening)
Tell Sparky about my day",
  notebook_id: personal_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Beautiful e.e. cummings poem",
  body: "somewhere i have never travelled,gladly beyond
  
somewhere i have never travelled,gladly beyond
any experience,your eyes have their silence:
in your most frail gesture are things which enclose me,
or which i cannot touch because they are too near

your slightest look easily will unclose me
though i have closed myself as fingers,
you open always petal by petal myself as Spring opens
(touching skilfully,mysteriously)her first rose

or if your wish be to close me, i and
my life will shut very beautifully ,suddenly,
as when the heart of this flower imagines
the snow carefully everywhere descending;

nothing which we are to perceive in this world equals
the power of your intense fragility:whose texture
compels me with the color of its countries,
rendering death and forever with each breathing

(i do not know what it is about you that closes
and opens;only something in me understands
the voice of your eyes is deeper than all roses)
nobody,not even the rain,has such small hands",
  notebook_id: quote_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Baby Bok Choy with Cashews",
  body: "Ingredients:
2 Tbsp olive oil
1 cup chopped green onions, including green ends
3 cloves garlic, chopped
1 pound baby bok choy, rinsed, larger leaves separated from base, base trimmed but still present, holding the smaller leaves together
1/2 teaspoon dark sesame oil
Salt
1/2 cup chopped, roasted, salted cashews

Directions:
1. Heat olive oil in a large sauté pan on medium high heat. Add onions, then garlic, then bok choy. Sprinkle with sesame oil and salt. Cover, and let the baby bok choy cook down for approximately 3 minutes. (Like spinach, when cooked, the bok choy will wilt a bit.)

2. Remove cover. Lower heat to low. Stir and let cook for a minute or two longer, until the bok choy is just cooked.

3. Gently mix in cashews.",
  notebook_id: recipe_notebook.id
})

demo.notes.create({
  title: "Quotes about Politics I Like",
  body: "'Reader, suppose you were an idiot. And suppose you were a member of Congress. But I repeat myself.'
- Mark Twain

'Politics is the art of looking for trouble, finding it everywhere, diagnosing it incorrectly and applying the wrong remedies.'
- Groucho Marx

'I predict future happiness for Americans, if they can prevent the government from wasting the labors of the people under the pretense of taking care of them.'
- Thomas Jefferson

'The heaviest penalty for declining to rule is to be ruled by someone inferior to yourself.'
- Plato, The Republic

Source: Goodreads.com",
  notebook_id: quote_notebook.id
})

demo.notes.create({
  title: "Funny Quotes",
  body: "'Never go to bed mad. Stay up and fight.'
- Phyllis Diller

'A day without sunshine is like, you know, night.'
- Steve Martin

'Outside of a dog, a book is man's best friend. Inside of a dog it's too dark to read.'
- Groucho Marx, The Essential Groucho: Writings For By And About Groucho Marx

'A good friend will always stab you in the front.'
- Oscar Wilde

'The story so far:
In the beginning the Universe was created.
This has made a lot of people very angry and been widely regarded as a bad move.'
- Douglas Adams, The Restaurant at the End of the Universe

'The reason I talk to myself is because I’m the only one whose answers I accept.'
- George Carlin

Source: Goodreads.com",
  notebook_id: quote_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Great Mitch Hedberg Lines",
  body: "11.  I don’t have a girlfriend. I just know a girl who would get really mad if she heard me say that.
10. I used to be a hot tar roofer. Yeah, I remember that ... day.
9. I had a paper route when I was a kid. I was a paperboy. I was supposed to go to 2,000 houses… or two dumpsters.
8. I find that a duck’s opinion of me is very much influenced over whether or not I have bread.
7. In England, Smokey the Bear is not the forest fire prevention representative. They have Smacky the Frog. It’s a lot like a bear, but it’s a frog. I think that’s a better system. I think we should adopt it. Because bears can be mean, but frogs are always cool. Never has there been a frog hopping toward me, and I thought 'Man, I’d better play dead. Here comes that frog.' I would never say 'Here comes that frog' in a horrifying manner. It’s always, like, optimistic. Like, 'Hey, here comes that frog, all right. Maybe he will settle near me and I can pet him, and put him in a mayonnaise jar, with a stick and a leaf, to recreate what he’s used to.'
6. I had one anchovy. That’s why I didn’t have two anchovies.
5. My friend asked me if I wanted a frozen banana, but I said 'No… but I want a regular banana later, so yeah.'
4. I like escalators, because an escalator can never break; it can only become stairs. There would never be an 'Escalator Temporarily Out of Order' sign. Only an 'Escalator Temporarily Stairs… Sorry for the Convenience.'
3. My belt holds up my pants and my pants have belt loops that hold up the belt. What the fuck’s really going on down there? Who is the real hero?
2. Every book is a children’s book if the kid can read.
1. I used to do drugs. I still do, but I used to, too.

Source: Buzzfeed.com",
  notebook_id: quote_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Workout Schedule",
  body: "Monday: Chest and biceps

  1) Incline DB press 4x10 (60lbs)
  2) Chest Flies 3x12 (25lbs)
  3) Seated Inclined Hammer Curls 3x10 (20lbs)
  4) push ups 2x15

Wednesday: Back and triceps

  1) Lat pull downs 4x10
  2) EZ bar rows 3x10
  3) Skull Crushers 3x10
  4) Tricep pressdown with rope 2x15

Friday: Legs

  1) leg extensions 3x15
  2) Do chest and back again

Sunday: 10 mile run",
  notebook_id: personal_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "World's Best Lasagna",
  body: "Prep Time: 30 Minutes
Cook Time: 2 Hours 30 Minutes
Ready In: 3 Hours 15 Minutes
Servings: 12

Ingredients:
1 pound sweet Italian sausage
3/4 pound lean ground beef
1/2 cup minced onion
2 cloves garlic, crushed
1 (28 ounce) can crushed tomatoes
2 (6 ounce) cans tomato paste
2 (6.5 ounce) cans canned tomato sauce
1/2 cup water
2 tablespoons white sugar
1 1/2 teaspoons dried basil leaves
1/2 teaspoon fennel seeds
1 teaspoon Italian seasoning
1 tablespoon salt
1/4 teaspoon ground black pepper
4 tablespoons chopped fresh parsley
12 lasagna noodles
16 ounces ricotta cheese
1 egg
1/2 teaspoon salt
3/4 pound mozzarella cheese, sliced
3/4 cup grated Parmesan cheese

Directions:
1.	In a Dutch oven, cook sausage, ground beef, onion, and garlic over medium heat until well browned. Stir in crushed tomatoes, tomato paste, tomato sauce, and water. Season with sugar, basil, fennel seeds, Italian seasoning, 1 tablespoon salt, pepper, and 2 tablespoons parsley. Simmer, covered, for about 1 1/2 hours, stirring occasionally.
2.	Bring a large pot of lightly salted water to a boil. Cook lasagna noodles in boiling water for 8 to 10 minutes. Drain noodles, and rinse with cold water. In a mixing bowl, combine ricotta cheese with egg, remaining parsley, and 1/2 teaspoon salt.
3.	Preheat oven to 375 degrees F (190 degrees C).
4.	To assemble, spread 1 1/2 cups of meat sauce in the bottom of a 9x13 inch baking dish. Arrange 6 noodles lengthwise over meat sauce. Spread with one half of the ricotta cheese mixture. Top with a third of mozzarella cheese slices. Spoon 1 1/2 cups meat sauce over mozzarella, and sprinkle with 1/4 cup Parmesan cheese. Repeat layers, and top with remaining mozzarella and Parmesan cheese. Cover with foil: to prevent sticking, either spray foil with cooking spray, or make sure the foil does not touch the cheese.
5.	Bake in preheated oven for 25 minutes. Remove foil, and bake an additional 25 minutes. Cool for 15 minutes before serving.

Source: Allrecipes.com",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.create({
  title: "Todo List",
  body: "Daily
Grocery shopping for dinner
Use BetterNote
Feed Sparky
Check workout schedule
Meditate for 20 minutes sometime today
Read weekly list if today is Sunday
Read monthly list if today is first day of the month

Weekly
Call mom and dad
Check apartment supplies, buy toilet paper, trash bags, etc. if necessary
Laundry
Update netflix queue

Monthly
Pay rent
Check credit card statement, make payment
Plan nice night out for sometime this month
Clean out fridge",
  notebook_id: personal_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
})

User.create({
  username: "Elizabeth",
  email: "friend1@betternote.us",
  password: "password"
})

friend1 = User.all.last

friend1.notebooks.create({
  name: "Harry Potter fanfiction"
})

hp_notebook = friend1.notebooks.last

Friendship.create({
  in_friend_id: friend1.id,
  out_friend_id: demo.id
})

Friendship.create({
  in_friend_id: demo.id,
  out_friend_id: friend1.id
})

friend1.notes.create({
  title: "Albus Dumbledore's First Love",
  body: "Albus Dumbledore was having a decidedly unpleasant day. Ariana had blown up the kitchen and Aberforth was being unhelpful. Funnily enough this was not what had made the day so unpleasant. These occurrences were actually not abnormal. It was that infernal postcard from Doge. A lengthy letter detailing exactly all the things Albus was missing: Egypt, Rome, China. He should be there with his best friend exploring the world and extending his powers. Instead he was here playing house.
  
Albus sighed and sent Aberforth out, before proceeding in rebuilding the kitchen. Ariana fortunately was upstairs writing. She loved to write, silly poems and heart breaking stories. It was one of Kendra’s better ideas, to teach the girl to write. It helped her channel some of her inner torment onto the pages. Not that it had saved Kendra of course, but it was still a good idea. It took Albus the better part of an hour to assemble the kitchen properly. When he was finished he had meant to write an article for Potions Periodical, but he wanted some fresh air.

He dusted himself off and stepped into the front garden. He knew he couldn’t abandon Ariana alone in the house so he just sat on the front steps.

'Albus, can you come here a minute?' It was Bathilda Bagshot, Albus’s neighbor. Glad for the excuse, he stood up and walked over to his neighbor’s house. Bathilda was a soft looking middle-aged witch with mousy brow hair and charming smile. Albus knew better. That woman could be fierce. She was a famous magical historian and she had an odd knack of seeing past illusions. Now she stood in her doorway looking hopeful.

'What can I do for you Ms. Bagshot?' Albus asked politely.

'My great nephew Gellert Grindelwald is staying with me for the summer,' She said, 'I thought you might appreciate having someone your own age to talk to. I suspect you have much in conmen.'  Albus was curious as Bathilda stepped aside. Behind her stood a boy of about Albus’s age. He was tall and pale, with golden hair and a calculating expression behind matching golden eyes.

'It is vey nice to meet you.' He said in a voice like melting butter, extending his hand. Albus shook it and replied with similar niceties. They talked for a few minutes, before Albus remembered Ariana and departed. In that short time he really got a sense of the other boy’s intelligence. Every word was obviously calculated but that didn’t stop him from being charming. Albus, almost despite himself began to feel less depressed when thinking about the summer.",
  notebook_id: hp_notebook.id
})

friend1.notes.create({
  title: "The Slytherin Challenge",
  body: "Every Slytherin Head of House who ever was had been a Slytherin student. There were no exceptions to this nor would there ever be. And it was for one reason and only one reason, a most important reason that this was. Only the Head of House knew the Slytherin Challenge. 
  
Ever since the Slytherin house had been in existence there had been the secret competition. The competition took place every year during the last full moon before school let out and all the seventh years graduated. It was held at midnight in the deepest, darkest dungeon of Hogwarts and only seventh year students were allowed to compete. They had to compete, whether they wanted to or not, for every Slytherin student who had ever lived had competed. 

All of the lower years were sent to bed by the Student Head of House at a quarter to twelve. The seventh years waited in the common room, fully dressed with their wands in their pockets, until the stroke of midnight. The Head of House opened the portrait on the twelfth stroke and led the group down. The hallways were without candles or torches and were eerily silent as the students followed their trusted professor. As they traveled deeper and deeper into the castle the halls became cold and the students’ breath became visible. The students kept in a tight group, trying to hide their fear from one another. Not one among their solemn group had any clues of what was to come, for every alumni who had ever partook in this event was sworn to secrecy. 

At last they stopped at the very end of the hall, the ground had ceased to be covered with bricks and was now no more than dirt. The doorway in front of them was flanked on either side by flaming torches. The door was large and strong. It was made entirely of steel and bore the Slytherin coat of arms; it had no locks or handles and would never budge without the key. The key was a sacred oath passed down from Salazar himself and had to be spoken in the strange tongue of the snakes, only then would the door slowly open, silent as a ghost.

The room that lay in front of the students was completely dark. None of the light from the torches penetrated past the edge of the door. The Head of House stood at the threshold, not quite entering the room, and he spoke slowly, 'Once you enter into this room, you may not exit until the competition is over.' The students gathered around in a half circle said nothing to this, they did not respond in any way, they knew it was expected of them. 

All of their parents were Slytherin alumni and would disown anyone of them if they did not enter into the competition. With a wave of his hand the Head of House motioned the students into the room, his feet staying firmly planted in the hallway, 'Instructions will be given to you once you enter.' There was a moment’s hesitation before the Student Head of House stepped into the large circular room, his classmates followed with not a word being spoken. As the last student’s feet passed over into the room the doors slid shut, again in complete silence. When they were secure and the lock had been put it place with a soft click, a large green ring of fire rose up from the floor and then settled down. When it was no more than a half a foot off the ground small circular stands became visible, one stand for each student, each with their name engraved in it. The students filed along and stood atop their stand, when each student was in place the flames rose again and a cold voice could be heard, 

'Slytherins. My dear, beloved Slytherins, it is now, in this room, that you will each prove whether you are a Slytherin or not.' 

The voice had an evil cackle as it pronounced 'Slytherin.' At once, when it had finished a last stand became clear in the center of the room, the fire around it burned as red as the sun and immediately it became clear that each student would stand there in turn and face what evil awaited.",
  notebook_id: hp_notebook.id
})

friend1.notes.create({
  title: "The Seakers",
  body: "Cho sat at the far end of the Ravenclaw table in the Great Hall. This was as close to isolation as she could get. The din of a hundred different conversations echoed from the ancient stones that made up Castle Hogwarts. Several different strains of laughter could be made out coming from various directions. It was a happy cheerful noise. It was completely inappropriate to Cho’s mood.
  
'Are you okay, Cho?' asked a concerned voice.
  
Cho did not even turn to see who had asked, but simply nodded. She was so tired of people asking her that question. She was okay. She wasn’t good or great. She wasn’t bad or terrible. She was okay, and all things considered, that was more than enough. She really wanted to move on from all of this, but that simply would not be possible, until people stopped asking her whether or not she was okay.
  
She gazed around the Great Hall at her feasting schoolmates. They were joking, and laughing, and bringing their friends up to date on the experiences of summer. One might think, from their expressions, that absolutely nothing was wrong in the world. One might think that the previous year had ended just as every other year had ended. One might think that Cedric Diggory had not died. She did not have the luxury of that illusion. Every single ‘Are you okay?’ was just another reminder of that.
  
Feeling as if she were the only unhappy person in the world, Cho continued to scan the faces of those around her. She was sure there was not a single person in the entire room who could understand how she felt. As her eyes went across the Gryffindor table they came upon a small, pale, dark haired figure idly picking at the plate in front of him. She had been wrong. That one knew exactly how she felt.
  
Knowing it was pointless to continue scanning, she kept her eyes fixed on him. He looked terrible. He was emaciated and his skin was sallow. His eyes, which were normally his best feature, looked tired and dull. Looking at him, one got the impression they were looking at a very old man, much older than was possible for one with his features. On either side of him sat Hermione Granger and Ronald Weasley, his constant companions since he had come to the school. Hermione was fussing over him and putting more food on his plate.
  
It wasn’t unusual for Harry to come back to Hogwarts looking pale and malnourished, but he had never looked this bad before. Cho had heard rumors that he spent his summers with Muggles who beat him and starved him. She had no idea whether the rumors were true or not, and she rather doubted that Professor Dumbledore would allow such a thing to happen, but it was obvious that summers were not kind to Harry Potter.
  
He had been there when Cedric had died. Cedric’s parents had told her the complete story. He had gone to great risk to bring back Cedric’s body so that it could be given a proper burial. No one had ever doubted that Harry was brave. He had proven that to everyone many times before. Bravery seemed to have its price though. It was bad enough that Cedric was dead, Harry looked as if he were going to become a casualty too.

'Cho, are you all right?' It was another nameless voice. Cho once again answered with a nod.

She wondered if Harry were asked about his well being as often as she was. Probably more, she thought, because in Harry’s case the matter was visibly open to debate. As if sensing her attentions, Harry looked up and for a second theirs eyes met. Cho gave him a thin smile. Harry instantly averted his eyes downward and seemed to sink even further into his chair, looking even more downcast than before.",
  notebook_id: hp_notebook.id
})

User.create({
  username: "Ryan",
  email: "friend2@betternote.us",
  password: "password"
})

friend2 = User.all.last

friend2.notebooks.create({
  name: "Todos"
})

todo_notebook = friend2.notebooks.last

Friendship.create({
  in_friend_id: friend2.id,
  out_friend_id: demo.id
})

Friendship.create({
  in_friend_id: demo.id,
  out_friend_id: friend2.id
})

friend2.notes.create({
  title: "Important stuff to do",
  body: "Write more notes on BetterNote, ???, profit",
  notebook_id: todo_notebook.id
})
