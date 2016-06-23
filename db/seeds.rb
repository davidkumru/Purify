# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

fabiano = User.create( email: 'fabiano@mail.com', password: 'abcd1234' )
dennis = User.create( email: 'dennis@mail.com', password: 'abcd1234' )
david = User.create( email: 'david@mail.com', password: 'abcd1234' )

Post.delete_all

letters = Post.create( title: "Letters make nice buildings", content: "Buildings used to be designed less as big blocks and more as complex shapes, even shaped like letters, to minimize the distance to an exterior wall and maximize natural light and ventilation. In fact, in 1773, Johann David Steingruber (Google auto-translation) published Architectonisches Alphabet, or Architectural Alphabet (Archive.org), providing an alphabet (more or less) worth of floor plans. It's in German, so you'll probably skip ahead and start with A. Of course, you can still find plenty of letter-shaped buildings (and write geo-greetings), thanks to the ubiquity of aerial photography.", user: fabiano)

revolutionaries = Post.create( title: "Why Revolutionaries Love Spicy Food", content: "The shrewd peasant organizer had a mean, even “spiteful” streak. “For example, for a long time I could not accustom myself to the strongly spiced food, such as hot fried peppers, which is traditional to southern China, especially in Hunan, Mao’s birthplace.” The Soviet agent’s tender taste buds invited Mao’s mockery. “The food of the true revolutionary is the red pepper,” declared Mao. “And he who cannot endure red peppers is also unable to fight.’ ” How the chili pepper got to China by Andrew Leonard", user: dennis)

uncanny = Post.create( title: "The Uncanny Mind That Built Ethereum", content: "Vitalik Buterin invented the world's hottest new cryptocurrency and inspired a movement — before he'd turned 20 - 'I think a large part of the consequence is necessarily going to be disempowering some of these centralized players to some extent because ultimately power is a zero sum game. And if you talk about empowering the little guy, as much as you want to couch it in flowery terminology that makes it sound fluffy and good, you are necessarily disempowering the big guy. And personally I say screw the big guy. They have enough money already.", user: david)

capitalism = Post.create( title: "...they’re really into capitalism.", content: "Don’t Know What To Read? Let Goldman Sachs Tell You. [Melville House] 'Goldman Sachs: financial giant, hotbed of enthusiasm for subprime mortgages, and hapless recipient of your hard-earned money. Who better to tell you what to read? Well, now they are telling you what to read, in the form of a recently-published recommended book list [PDF]. We’re talking about people who incurred $550 million in fines for schemes to turn a profit on the civilization-threatening financial crisis they themselves had helped create, and the line between genius and chutzpah is notoriously hard to draw, so, yeah, I’d like to know what’s on these folks’ bedside tables.", user: dennis)

american = Post.create( title: "What's changed and changing about (American) politics?", content: "There are three major political forces in contemporary politics in developed countries: tribalism, neoliberalism and leftism (defined in more detail below). Until recently, the party system involved competition between different versions of neoliberalism. Since the Global Financial Crisis, neoliberals have remained in power almost everywhere, but can no longer command the electoral support needed to marginalise both tribalists and leftists at the same time. So, we are seeing the emergence of a three-party system, which is inherently unstable because of the Condorcet problem and for other reasons.", user: fabiano)

black = Post.create( title: "3 heads of the Black Dog, decades of post-techno and futuristic exotica", content: "Ken Downie, Ed Handley and Andy Turner were mates back in the day, digging into b-boy stuff as it came into England, mixing in sounds from Chicago and Detroit, acid and techno, and making it their own. They released three EPs on their own, and joined Warp Records in 1993 with the iconic album, Bytes, which already showed a fractured nature to the group, with eight different entities attributed for the album and individual tracks, but they wouldn't formally fracture for a few more years. Ken Downie kept The Black Dog, which he named in part for his battle with depression, while Ed and Andy became Plaid. With Plaid's newest album, The Digging Remedy, each now with 11 albums to their names. Read on for more history and tunes.", user: david)

Comment.delete_all

Comment.create( comment: "text by david", post: black, user: david )
Comment.create( comment: "text by dennis", post: black, user: dennis )
Comment.create( comment: "text by dennis", post: american, user: dennis )
Comment.create( comment: "text by fabiano", post: american, user: fabiano )
Comment.create( comment: "text by david", post: capitalism, user: david )
Comment.create( comment: "text by dennis", post: revolutionaries, user: dennis )
Comment.create( comment: "text by fabiano", post: capitalism, user: fabiano )
Comment.create( comment: "text by fabiano", post: letters, user: fabiano )
Comment.create( comment: "text by david", post: uncanny, user: david )
