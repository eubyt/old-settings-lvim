local M = {}

M.txt = function()
    math.randomseed(os.time())
    local words = {{"Eubyt: !revolução",
                    "L4k3: Todo mundo um dia vai morrer e ser esquecido, aja e se comporte de uma forma que vai fazer a vida mais interessante, foda-se um",
                    "trabalho mundano de domingo a sexta com algo que vc não tira nenhum prazer disso, só vivendo até que você envelheça e apodreça",
                    "encontre uma paixão, forme relacionamentos, não tenha medo de ir fazer alguma coisa diferente e foda-se o que todo mundo pensa, confie em mim, é mt mais divertido dessa maneira.",
                    "Nunca coloque as pessoas pra baixo, em vez disso apenas se coloque pra cima e deixe os haters fazerem o trabalho deles, eu prefiro",
                    "ser uma pessoa odiada do que uma pessoa que odeia os outros, essa é a nossa revolução.", "", "",
                    "Chat do twitch.tv/l4k3"}, 'You will become very rich!', 'You will fall into a big hole!',
                   'You will find a worm in your next apple!', 'You will lose your umbrella!',
                   'You will dig up some treasure at the beach!', 'You will turn into a newt!',
                   'You will get no homework tomorrow!', 'You will get eaten by a dragon!', "You got this",
                   "You'll figure it out", "You're a smart cookie", "I believe in you",
                   "Sucking at something is the first step towards being good at something",
                   "Struggling is part of learning", "Everything has cracks - that's how the light gets in",
                   "Mistakes don't make you less capable", "We are all works in progress", "You are a capable human",
                   "You know more than you think", "10x engineers are a myth", "If everything was easy you'd be bored",
                   "I admire you for taking this on", "You're resourceful and clever", "You'll find a way",
                   "I know you'll sort it out", "Struggling means you're learning", "You're doing a great job",
                   "It'll feel magical when it's working", "I'm rooting for you",
                   "Your mind is full of brilliant ideas",
                   "You make a difference in the world by simply existing in it",
                   "You are learning valuable lessons from yourself every day",
                   "You are worthy and deserving of respect", "You know more than you knew yesterday",
                   "You're an inspiration",
                   "Your life is already a miracle of chance waiting for you to shape its destiny",
                   "Your life is about to be incredible",
                   "Nothing is impossible. The word itself says 'I’m possible!'",
                   "Failure is just another way to learn how to do something right",
                   "I give myself permission to do what is right for me", "You can do it",
                   "It is not a sprint, it is a marathon. One step at a time",
                   "Success is the progressive realization of a worthy goal",
                   "People with goals succeed because they know where they’re going",
                   "All you need is the plan, the roadmap, and the courage to press on to your destination",
                   "The opposite of courage in our society is not cowardice... it is conformity",
                   "Whenever we’re afraid, it’s because we don’t know enough. If we understood enough, we would never be afraid",
                   "The past does not equal the future", "The path to success is to take massive, determined action",
                   "It’s what you practice in private that you will be rewarded for in public",
                   "Small progress is still progress",
                   "Don't worry if you find flaws in your past creations, it's because you've evolved",
                   "Starting is the most difficult step - but you can do it", "Don't forget to enjoy the journey",
                   "It's not a mistake, it's a learning opportunity", "Your strength is greater than any struggle",
                   "You matter", "You are allowed to say 'no' to others and 'yes' to yourself",
                   {"ih 🥴 🥴 🥴 pressao baixo 🤒 🤒 🤒 🤒 ih 🥱 🥱 🥱 🥴 pressao baixo 🥱 🤒 🤒 👎 zzzzZZZZZZ",
                    "zzzZZZZZZZ 😴 😴 😴 😴 😴 zzzzZZZZZZ 😴 😴 😴 zzzZZZZZZZ 😴 😴 😴 😴 😴 salve ai mano 😜 👍"}}

    return words[math.random(1, #words)]
end

return M
