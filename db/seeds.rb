User.create({
  username: "Aiden",
  email: "demo@betternote.us",
  password: "password"
})

demo = User.all.first

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

User.create({
  username: "Tom",
  email: "friend3@betternote.us",
  password: "password"
})

friend3 = User.all.last

Friendship.create({
  in_friend_id: friend3.id,
  out_friend_id: demo.id
})

Friendship.create({
  in_friend_id: demo.id,
  out_friend_id: friend3.id
})

friend1.notes.create({
  title: "Albus Dumbledore's First Love",
  body: "Albus Dumbledore was having a decidedly unpleasant day. Ariana had blown up the kitchen and Aberforth was being unhelpful. Funnily enough this was not what had made the day so unpleasant. These occurrences were actually not abnormal. It was that infernal postcard from Doge. A lengthy letter detailing exactly all the things Albus was missing: Egypt, Rome, China. He should be there with his best friend exploring the world and extending his powers. Instead he was here playing house.
  
Albus sighed and sent Aberforth out, before proceeding in rebuilding the kitchen. Ariana fortunately was upstairs writing. She loved to write, silly poems and heart breaking stories. It was one of Kendra’s better ideas, to teach the girl to write. It helped her channel some of her inner torment onto the pages. Not that it had saved Kendra of course, but it was still a good idea. It took Albus the better part of an hour to assemble the kitchen properly. When he was finished he had meant to write an article for Potions Periodical, but he wanted some fresh air.

He dusted himself off and stepped into the front garden. He knew he couldn’t abandon Ariana alone in the house so he just sat on the front steps.

'Albus, can you come here a minute?' It was Bathilda Bagshot, Albus’s neighbor. Glad for the excuse, he stood up and walked over to his neighbor’s house. Bathilda was a soft looking middle-aged witch with mousy brow hair and charming smile. Albus knew better. That woman could be fierce. She was a famous magical historian and she had an odd knack of seeing past illusions. Now she stood in her doorway looking hopeful.",
  notebook_id: hp_notebook.id
})

friend1.notes.last.comments.create({
  author_id: demo.id,
  body: "Great story!  I'm a big Dumbldore fan."
})

friend1.notes.last.comments.create({
  author_id: friend1.id,
  body: "I know!  He's one of my favorite wizards too."
})

friend1.notes.create({
  title: "The Slytherin Challenge",
  body: "Every Slytherin Head of House who ever was had been a Slytherin student. There were no exceptions to this nor would there ever be. And it was for one reason and only one reason, a most important reason that this was. Only the Head of House knew the Slytherin Challenge. 
  
Ever since the Slytherin house had been in existence there had been the secret competition. The competition took place every year during the last full moon before school let out and all the seventh years graduated. It was held at midnight in the deepest, darkest dungeon of Hogwarts and only seventh year students were allowed to compete. They had to compete, whether they wanted to or not, for every Slytherin student who had ever lived had competed. 

All of the lower years were sent to bed by the Student Head of House at a quarter to twelve. The seventh years waited in the common room, fully dressed with their wands in their pockets, until the stroke of midnight. The Head of House opened the portrait on the twelfth stroke and led the group down. The hallways were without candles or torches and were eerily silent as the students followed their trusted professor. As they traveled deeper and deeper into the castle the halls became cold and the students’ breath became visible. The students kept in a tight group, trying to hide their fear from one another. Not one among their solemn group had any clues of what was to come, for every alumni who had ever partook in this event was sworn to secrecy. 

At last they stopped at the very end of the hall, the ground had ceased to be covered with bricks and was now no more than dirt. The doorway in front of them was flanked on either side by flaming torches. The door was large and strong. It was made entirely of steel and bore the Slytherin coat of arms; it had no locks or handles and would never budge without the key. The key was a sacred oath passed down from Salazar himself and had to be spoken in the strange tongue of the snakes, only then would the door slowly open, silent as a ghost.",
  notebook_id: hp_notebook.id
})

friend1.notes.last.likes.create({
  owner_id: demo.id
})

friend1.notes.create({
  title: "The Seakers",
  body: "Cho sat at the far end of the Ravenclaw table in the Great Hall. This was as close to isolation as she could get. The din of a hundred different conversations echoed from the ancient stones that made up Castle Hogwarts. Several different strains of laughter could be made out coming from various directions. It was a happy cheerful noise. It was completely inappropriate to Cho’s mood.
  
'Are you okay, Cho?' asked a concerned voice.
  
Cho did not even turn to see who had asked, but simply nodded. She was so tired of people asking her that question. She was okay. She wasn’t good or great. She wasn’t bad or terrible. She was okay, and all things considered, that was more than enough. She really wanted to move on from all of this, but that simply would not be possible, until people stopped asking her whether or not she was okay.
  
She gazed around the Great Hall at her feasting schoolmates. They were joking, and laughing, and bringing their friends up to date on the experiences of summer. One might think, from their expressions, that absolutely nothing was wrong in the world. One might think that the previous year had ended just as every other year had ended. One might think that Cedric Diggory had not died. She did not have the luxury of that illusion. Every single ‘Are you okay?’ was just another reminder of that.",
  notebook_id: hp_notebook.id
})

friend1.notes.last.comments.create({
  author_id: demo.id,
  body: "Poor Cho :("
})

friend1.notes.last.comments.create({
  author_id: friend1.id,
  body: "Yeah, I feel bad for her.  RIP Cedric :("
})

friend1.notes.last.likes.create({
  owner_id: demo.id
})

User.create({
  username: "Ryan",
  email: "friend2@betternote.us",
  password: "password"
})

friend2 = User.all.last


Friendship.create({
  in_friend_id: friend2.id,
  out_friend_id: demo.id
})

Friendship.create({
  in_friend_id: demo.id,
  out_friend_id: friend2.id
})

friend2.notebooks.create({
  name: "Todos"
})

todo_notebook = friend2.notebooks.last

friend2.tags.create({
  name: "IMPORTANT"
})

friend2.notes.create({
  title: "Important stuff to do",
  body: "Write more notes on BetterNote, ???, profit",
  notebook_id: todo_notebook.id
})

friend2.notes.last.likes.create({
  owner_id: demo.id
})

friend2.notes.last.note_tags.create({
  tag_id: friend2.tags.last.id
})

friend3.notebooks.create({
  name: "Cool Lyrics"
})

lyrics_notebook = friend3.notebooks.last

friend3.tags.create({
  name: "Rap Songs"
})

rap_tag = friend3.tags.last

friend3.tags.create({
  name: "Indie Songs"
})

indie_tag = friend3.tags.last

friend3.notes.create({
  title: "Hip Hop by Dead Prez",
  body: "One thing bout music when it hit you feel no pain / White folks say it controls your brain; I know better than that, that's game / And we ready for that, two soldiers head of the pack / Matter of fact, who got the gat / And where my army at, rather attack and not react / Back to beats, it don't reflect on how many records get sold",
  notebook_id: lyrics_notebook.id
})

friend3.notes.last.note_tags.create({
  tag_id: rap_tag.id
})

friend3.notes.create({
  title: "Jesus Walks by Kanye",
  body: "I ain't here to argue about his facial features / Or here to convert atheists into believers / I'm just trying to say the way school need teachers / The way Kathie Lee needed Regis that's the way I need Jesus / So here go my single dog radio needs this / They say you can rap about anything except for Jesus / That means guns, sex, lies, video tapes / But if I talk about God my record won't get played Huh?",
  notebook_id: lyrics_notebook.id
})

friend3.notes.last.note_tags.create({
  tag_id: rap_tag.id
})

friend3.notes.last.likes.create({
  owner_id: demo.id
})

friend3.notes.create({
  title: "Pumped Up Kicks, Foster the People",
  body: "Robert’s got a quick hand / He’ll look around the room / He won’t tell you his plan / He’s got a rolled cigarette / Hanging out his mouth he’s a cowboy kid / Yeah, he found a 6-shooter gun / In his dad's closet / Hidden in a box of fun things / And I don’t even know what / But he’s coming for you / Yeah, he’s coming for you",
  notebook_id: lyrics_notebook.id
})

friend3.notes.last.note_tags.create({
  tag_id: indie_tag.id
})

friend3.notes.last.comments.create({
  author_id: demo.id,
  body: "This song rocks."
})

friend3.notes.create({
  title: "Two Weeks, Grizzly Bear",
  body: "Save up all the days / A routine malaise / Just like yesterday / I told you I would stay / Would you always? / Maybe sometimes? / Make it easy? / Take your time",
  notebook_id: lyrics_notebook.id
})

friend3.notes.last.note_tags.create({
  tag_id: indie_tag.id
})

friend3.notes.create({
  title: "I Love My Dad by Sun Kil Moon",
  body: "When I was young my father told me, to each his own / The lady said as she kissed the cow / Some like the fiddle, some like the trombone / And I live by that rule",
  notebook_id: lyrics_notebook.id
})

friend3.notes.last.comments.create({
  author_id: demo.id,
  body: "Such a beautiful song."
})

friend3.notes.last.note_tags.create({
  tag_id: indie_tag.id
})

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

demo.tags.create({
  name: "Sparky!"
})

sparky_tag = demo.tags.last

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
  title: "Possible gifts for Tom's birthday",
  body: "Crosley Radio USB Turntable
Das Horn Drinking Horn
Spitfire Flask
Herschel Ravine Gym Bag
Self Cleaning Fish Tank
Drone
Game of Thrones Wax Seal Coasters
Electronic FPS Laser Battle Jacket
Boba Fett Hoodie
Bose SoundLink Bluetooth Speaker
Whiskey Stones
Portal 2 Miniature Replica Portal Gun
Star Wars Lightsaber Umbrella
Rescue Portable USB Battery Pack",
  notebook_id: gift_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.last.likes.create({
  owner_id: friend1.id
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
  title: "Gift ideas for Grandpa's birthday",
  body: "Crosley mini CD jukebox
The Beatles Stereo Vinyl box set
I'd Rather Be Fishing T-shirt
Fly fishing gear
Personalized Top Flight golf balls (1 dozen)
'King of the Grill' wood cutting board
Self chilling pint glasses
Wooden mustache",
  notebook_id: gift_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
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

demo.notes.last.likes.create({
  owner_id: friend1.id
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

demo.notes.last.likes.create({
  owner_id: friend2.id
})

demo.notes.last.note_tags.create({
  tag_id: bmm_tag.id
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

demo.notes.last.likes.create({
  owner_id: friend1.id
})

demo.notes.create({
  title: "Favorite Quotes",
  body: "'If you want to know what a man's like, take a good look at how he treats his inferiors, not his equals.'
- J.K. Rowling, Harry Potter and the Goblet of Fire
  
'I love deadlines. I love the whooshing noise they make as they go by.'
- Douglas Adams, The Salmon of Doubt

'Woof!'
- Sparky

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

demo.notes.last.note_tags.create({
  tag_id: bmm_tag.id
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

demo.notes.last.likes.create({
  owner_id: friend2.id
})

demo.notes.create({
  title: "Gifts for Mom",
  body: "-- Kitten Journal
-- Keep Calm And Drink Tea Mug
-- Bunny Brooch
-- Ryan Gosling Tea Set
-- Vintage Picnic Basket
-- Victorian House Tea Towel
-- Peony Art Print
-- Home Print
-- Dachshund Figurine
-- Koala Cross Stitch Pattern
-- Concrete And Glass Vase
-- Rhino Planter
-- Mason Jar Soap Dispenser
-- Vegan Lip Balm
-- Sloth Sleep Mask",
  notebook_id: gift_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: tattoo_tag.id
})

demo.notes.last.likes.create({
  owner_id: friend1.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
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
  body: "-- Get Lucky by Daft Punk
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

demo.notes.last.likes.create({
  owner_id: friend1.id
})

demo.notes.last.note_tags.create({
  tag_id: bmm_tag.id
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
  tag_id: sparky_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
})

demo.notes.last.likes.create({
  owner_id: friend2.id
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

demo.notes.last.likes.create({
  owner_id: friend1.id
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
  title: "Gift ideas for Sparky",
  body: "-- Dr. Fosters and Smith Turkey Leg Rawhide Dog Bones, ($5)
-- Kyjen Dog Games Star Spinner Treat Toy ($14)
-- Petco's Brown and Tan Memory Foam Rectangular Pillow Dog Bed ($50)
-- Lands End Wood Chuck Orbee-Tuff Chew and Fetch Ball ($25)
-- Puppia Santa Harness ($20)
-- Lands End Hand-Knit Cable Pet Sweater ($40)
-- Lands End Doggie Jackets ($15)",
  notebook_id: gift_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.last.likes.create({
  owner_id: friend1.id
})

demo.notes.last.note_tags.create({
  tag_id: sparky_tag.id
})

demo.notes.last.comments.create({
  author_id: friend3.id,
  body: "SPARKY.  Love that dog."
})

demo.notes.last.comments.create({
  author_id: demo.id,
  body: "I KNOW RIGHT"
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

demo.notes.last.likes.create({
  owner_id: friend2.id
})

demo.notes.last.comments.create({
  author_id: friend1.id,
  body: "Mitch was the best.  I love number 8."
})

demo.notes.last.likes.create({
  owner_id: friend1.id
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

demo.notes.last.likes.create({
  owner_id: friend1.id
})

demo.notes.last.comments.create({
  author_id: friend3.id,
  body: "Yummmmm.  I need to try this one out"
})

demo.notes.last.comments.create({
  author_id: demo.id,
  body: "So good!!!  FYI sometimes I use spicy sausage instead of sweet--makes it a ton better IMO."
})

demo.notes.last.comments.create({
  author_id: friend3.id,
  body: "Sweet, thanks for the tip."
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

demo.notes.last.comments.create({
  author_id: friend2.id,
  body: "Hahaha Aiden you're gonna get HUGE"
})

demo.notes.create({
  title: "Doggie Biscuits for Sparky",
  body: "Prep Time: 25 Minutes
Cook Time: 20 Minutes
Ready In: 1 Hour 15 Minutes
Servings: 36

Ingredients:
1 1/2 cups whole wheat flour
1/2 cup all-purpose flour
1/2 cup cornmeal
1/2 cup rolled oats
1 1/2 cups water, or as needed
1/2 cup canola oil
2 eggs
3 tablespoons peanut butter
2 tablespoons vanilla extract

Directions:
1.	Preheat oven to 400 degrees F (200 degrees C). Grease cookie sheets.
2.	Mix together whole-wheat flour, all-purpose flour, cornmeal and oats. Make a well in the center of the dry ingredients and gradually pour in water, oil, eggs, peanut butter and vanilla. Mix well.
3.	On a flat surface use a rolling pin to roll out the dough. Cut the dough into dog biscuit shapes using a cookie cutter. Place the biscuits onto the prepared cookie sheet.
4.	Bake the cookies for 20 minutes. After the biscuits have cooked 20 minutes turn off the oven off but let the biscuits remain inside the oven for another 20 minutes to harden.",
  notebook_id: recipe_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: sparky_tag.id
})

demo.notes.last.likes.create({
  owner_id: friend2.id
})

demo.notes.last.likes.create({
  owner_id: friend1.id
})

demo.notes.last.comments.create({
  author_id: friend1.id,
  body: "You spoil that dog!  What a lucky corgi..."
})

demo.notes.last.comments.create({
  author_id: demo.id,
  body: "Yeah, maybe I do..... ;)"
})

demo.notes.last.comments.create({
  author_id: friend3.id,
  body: "Ahhhhh I miss Sparky!  You need to let me puppysit him more."
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




demo.notes.last.comments.create({
  author_id: friend1.id,
  body: "Go grocery shopping for me too!!!  ;)"
})

demo.notes.last.likes.create({
  owner_id: friend2.id
})

demo.notes.last.likes.create({
  owner_id: friend1.id
})

demo.notes.last.note_tags.create({
  tag_id: important_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: summer_tag.id
})

demo.notes.last.note_tags.create({
  tag_id: sparky_tag.id
})

demo.notes.create({
  title: "Welcome to BetterNote!",
  body: "Thanks for checking out BetterNote, a clone of Evernote, the popular note-taking app.  Some features to try out:

Notes
-- Create a note using the 'New Note' button next to the search bar
-- Edit a note's content by clicking its title and body on the right side of the page
-- Change a note's notebook by clicking on the notebook dropdown under the 'New Note' button
-- Add a tag to a note by clicking on the '+ Tag' button
-- Like or delete a note by clicking on the like and delete buttons at the top right of the screen
-- Comment on a note by clicking 

Notebook/Tags
-- Add a notebook by clicking on the button to the right of the 'Notebooks' subhead in the sidebar
-- Add a tag by clicking on the button to the right of the 'Tags' subhead in the sidebar
-- Edit (or delete) a notebook or tag by clicking on the icon that appears when you hover on a notebook/tag item in the sidebar

Note Collections
-- Sort the selected notes by clicking on the 'View Options' menu at the bottom of the note preview section
-- Filter notes by search term using the search bar
-- Filter notes by tag by clicking on the tags in the sidebar
-- View friends' notes by clicking on the friend items in the sidebar",
  notebook_id: personal_notebook.id
})

demo.notes.last.note_tags.create({
  tag_id: sparky_tag.id
})