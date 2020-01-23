# frozen_string_literal: true

require 'twitter'
require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'

journalists = ["@jcunniet", "@Aziliz31", "@ssoumier", "@marionsouzeau", "@gaellombart", "@bendarag", "@AurelieLebelle", "@julienduffe", "@thomaspoupeau", "@LilyRossignol", "@ClairGuedon", "@stephanieauguy", "@claw_prolongeau", "@_JulieMenard", "@LColcomb", "@Zlauwereys", "@MeLonguet", "@DorotheeLN", "@NolwennCosson", "@ADaboval", "@Remibaldy", "@bderveaux", "@amandechap", "@ELODIESOULIE", "@nbongarcon", "@HeloAb", "@gregplou", "@BenoitBerthe", "@LauraBruneau89", "@Anthony_Lieures", "@Sharonwaj", "@mcsonkin", "@pverduzier", "@emiliel3", "@Julien_MARION", "@SophiFay", "@bdelombre", "@annalecerf", "@AdriaBudry", "@DejNikolic", "@iJaffre", "@CyrusleVirus", "@GPardigon", "@e_vallerey", "@IsabelleSouquet", "@AudeDavidRossi", "@Yoann_Pa", "@CeliaPenavaire", "@perraultvincent", "@cboulate", "@JustineWeyl", "@Paulinejacot", "@juliechab", "@aslechevallier", "@phnou", "@Seb_Pommier", "@Alex_Bensaid", "@GuillaumeGaven", "@annelaurechouin", "@Oliviader", "@guerricp", "@JMMarchaut", "@cyceron", "@gregory_raymond", "@vhunsinger", "@l_peillon", "@fannyguinochet", "@EAssayag", "@YvonHerry", "@JohanGarciajg", "@saidlabidi", "@lauranneprov", "@LeaDavy", "@francois_remy", "@CGuicheteau", "@FloMaillet", "@m_perroud", "@oBrunet_TSMF", "@MoonVdc", "@jc2taille", "@NellyMoussu", "@VirginK", "@b_misa", "@FabriceCouste", "@barbara_prose", "@lelia2m", "@brunoaskenazi", "@laurenechamp", "@ysisbox", "@juliengagliardi", "@PierreLel", "@kdeniau", "@_TerraInc", "@DominicArpin", "@antoinfonteneau", "@nanotousch", "@jb_roch", "@YaniKhezzar", "@Anne_Bechet", "@NCapart", "@SamyBenNaceur", "@Joumany", "@Julietteraynal", "@TGiraudet", "@SaraTanit", "@HappeFrederic", "@antoinellorca", "@michelpicot", "@Sev_Ryne", "@bobdobolino", "@murdever", "@YGrandmontagne", "@Mnyo", "@EdKOSCIANSKI", "@tnoisette", "@jankari", "@delbello_rom", "@rflechaux", "@NadiaSorelli", "@IT_Digital", "@abarbaux", "@PhilippeLeroy", "@schaptal", "@marionspee", "@lisavignoli", "@ChloeAeberhardt", "@MartineJacot", "@JuliaPascualita", "@curieusedetout", "@sgraveleau", "@bif_o", "@zinebdryef", "@apiquard", "@pierrehaski", "@StephanieDelmas", "@Blandine_Garot", "@vergara_i", "@evan_lebastard", "@SophieVclt", "@OlivierLevrault", "@alicedorgeval", "@LouiseMalnoy", "@alix_fx", "@pierre_baudis", "@LucMagoutier", "@AgatheMuller", "@SGianninelli", "@PaulineBoyer33", "@NaomiHalll", "@romaindlx", "@marionbr", "@Burtschy", "@JacobEtienne", "@as_lizzani", "@marie_simon", "@LaureDaussy", "@FabriceAmedeo", "@LoubnaChlaikhy", "@PlummerWilliam", "@OlivierMarin1", "@alaurefremont", "@mwesfreid", "@ChBaDe", "@pmathon", "@theobaldmarie", "@Lnpagesy", "@marclandre", "@paoliniesther", "@Feertchak", "@JBLitzler", "@GuillaumeErrard", "@quentinperinel", "@TristanQM", "@mlbo", "@constancejamet", "@LoraTerrazas", "@emiliegeffray", "@Mathilde_Sd", "@CaroPiquet", "@DCanivez", "@TIM_7375", "@blandinelc", "@ivanrioufol", "@arthurberdah", "@SarahLecoeuvre", "@guillaume_gui", "@DamienMercereau", "@W_Chloe", "@Assma_MD", "@EugenieBastie", "@HiTech_lexpress", "@bcondominas", "@Laurie_Z_", "@jeanfrancgerard", "@MathieuPagura", "@BGUYF", "@AlainPiffaretti", "@AudreyKucinskas", "@julienhory", "@Pierrefalga", "@TiphThuillier", "@cdaniez", "@LigerBaptiste", "@D_Peras", "@julie_dlb", "@julian2lamancha", "@GaetaneDeljurie", "@JulianMattei", "@M_Vicuna", "@DeBruynOlivier", "@Nehed_Jendoubi", "@antoine_grenapi", "@ColonnaGen", "@VictoriaGairin", "@Clement_Lacombe", "@TVigoureux", "@MargauxObriot", "@solinedelos", "@RocheSabine", "@dangerkens", "@EdouardDutour", "@MDondeyne", "@DupuisNathalie1", "@bouscarel", "@Mathieu2jean", "@Sophie_T_J", "@laurentcalixte", "@patrockwilliams", "@PascaleKremer", "@AlexJaquin", "@LauraIsaaz", "@cath_robin", "@Del_Gautherin", "@Isaduriez", "@lucietuile", "@AugeyBastien", "@mcastagnet", "@AminaKalache", "@mvaudano", "@CParrot", "@ombelinetips", "@_JoinLion", "@BarbolosiRose", "@ToiBruno1", "@FloraClodic", "@xjbdx", "@AlexiaEy", "@Emjy_STARK", "@elcoco01", "@rabilebon", "@pflovens_", "@FabriceFrossard", "@MorganeSERRES", "@MarjolaineKoch", "@edgarsnow", "@SRNLF", "@CChassigneux", "@NassiraELM", "@NewsRicard", "@Sandreene", "@Emilezrt", "@Pierre_Do", "@Micode", "@CColumelli", "@DavidAbiker", "@ClementBergantz", "@benjaminrabier", "@celinekallmann", "@edwyplenel", "@C_Barbier", "@JJBourdin_RMC", "@LaurenceFerrari", "@aslapix", "@IsaMillet", "@MaximeSwitek", "@tomjoubert", "@jszanchi", "@roqueeva", "@XavierBiseul", "@florencesantrot", "@AntoineCrochet", "@freeman59", "@MaudeML", "@philippe_gulpi", "@mathieum76", "@kiouari", "@imanemoustakir", "@BenedicteMallet", "@Emilie_Brouze", "@antoinebarret", "@_nicolasbocquet", "@remibuhagiar", "@CourretB", "@AymericRobert", "@miraelmartins", "@pmaniere", "@jesuisraphk", "@David_Ingram", "@pcelerier", "@technomedia", "@Geraldinedauver", "@ThierryLabro", "@Newsdusud", "@nrauline", "@gbregeras", "@SCouasnonBFM", "@actualites_nrv", "@dimitrimoulins", "@oli_aura", "@FabieChiche", "@Vincent_Raimblt", "@ChristophGreuet", "@PAlbuchay", "@MarrauddesGrot", "@vtalmon", "@cedric", "@olivierfrigara", "@Julien_Jay", "@LydiaBerroyer", "@Shuua", "@datisdaz", "@Steuph", "@ameliecharnay", "@Bruno_LesNums", "@LelloucheNico", "@CciliaDiQuinzio", "@Elodie_C", "@SylvRolland", "@Kocobe", "@FL_Debes", "@jdupontcalbo", "@GarciaVictor_", "@NicoRichaud", "@RHoueix", "@simottel", "@DamienLicata", "@annabelle_L", "@Lea_Lejeune", "@axel_deb", "@marin_eben", "@ptiberry", "@MatthieuDelach", "@sandrinecassini", "@benjaminferran", "@ppgarcia75", "@NotPatrick", "@ivalerio", "@FabienneSchmitt", "@alexgoude", "@JeromeColombain", "@manhack", "@Capucine_Cousin", "@Fsorel", "@oliviertesquet", "@marjoriepaillon", "@ginades", "@PierreTran", "@DelphineCuny", "@reesmarc", "@lauratenoudji", "@ldupin", "@carolinedescham", "@Lucile_Quillet", "@cgabizon", "@Allocab", "@epenser", "@JAGventeprivee", "@frwrds", "@Laure__Bourdon", "@Xavier75", "@maximeverner", "@s_jourdain"]
$actions = 0
$time = Time.now()

def return_streaming_client
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end

def select_n_random_journalists(array_of_journalists, number)
  array_of_journalists.sample(number)
end

def return_last_tweets_ids_containing(tweet, number, client)
  entries = []
  client.search(tweet, {count: number, result_type: "recent"}).each do |entry|
  entries.push(entry)
  end
  entries
end

def return_last_users_having_tweeted_tweet_containing(tweet, number, client)
  users = []
  h = client.search(tweet, {count: number, result_type: "recent"}).each do |tweet|
    u_id = tweet.attrs[:user][:id]
    if users.include?(u_id)
      next
    else
      users.push(u_id)
    end
  end
  return users[0..20]
end
def return_client
  Dotenv.load('.env') # Ceci appelle le fichier .env (situé dans le même dossier que celui d'où tu exécute app.rb)
  # et grâce à la gem Dotenv, on importe toutes les données enregistrées dans un hash ENV
  # quelques lignes qui appellent les clés d'API de ton fichier .env
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  client
end

# ligne qui permet de tweeter sur ton compte
#  client.update('Mon premier tweet en Ruby !!!!')
def send_tweets_to_journalists(journalists_array, client)
  bonjour_monde = "\#bonjour_monde"
  love_work = "I love your work! It's really awesome!"
  thp = "@the_hacking_pro"
  select_n_random_journalists(journalists_array, 5).each do |j|
    client.update(j + " " + love_work + " " + bonjour_monde + " " + thp)
    # p (j + " " + love_work + " " + bonjour_monde + " " + thp)
  end
end

client = return_client
client_stream = return_streaming_client
$my_id = client.user.id
def like_tweets_containing(tweet, number, client)
  return_last_tweets_ids_containing(tweet, number, client).each do |entry|
  client.favorite(entry)
  end
end

def follow_users_having_tweet_containing(tweet, number, client)
  return_last_users_having_tweeted_tweet_containing(tweet, number, client).each do |id|
  client.follow(id)  
  end
end

def return_tweet_user(tweet)
  tweet.user.id
end

def follow_user (user_id, client)
  if user_id != $my_id
    client.follow(user_id)
    puts "You just followed user id : #{user_id} !!"
    $actions += 1
  end
  
end

def like_tweet (tweet_id, client)
  client.favorite(tweet_id)
  puts "You just liked tweet id : #{tweet_id} !!"
  $actions += 1
end

def bot (client_stream, client_rest)
  topics = ["\#bonjour_monde"]
  $time = Time.now()
  n = 0
  while n < 15
    client_stream.filter(track: topics.join(",")) do |object|
      if object.is_a?(Twitter::Tweet)
        if $actions <15
          p $time
          like_tweet(object.id, client_rest)
          user = return_tweet_user(object)
          if user != $my_id
            follow_user(user, client_rest)
          end
          
        elsif Time.now().to_i - $time.to_i > 60*15
          puts "Time reset"
          $time = Time.now()
          $actions = 0
          like_tweet(object.id, client_rest)
          user = return_tweet_user(object)
          if user != $my_id
            follow_user(user, client_rest)
          end
        else
          puts "Now waiting for 1/4h"
          sleep(60*15)
          $time = Time.now()
          puts "Timer reset"
          $actions = 0
        end
      end
    end
  end
end
p $time
bot(client_stream, client)
#p follow_users_having_tweet_containing("\#bonjour_monde -rt", 100, client)
#p return_last_users_having_tweeted_tweet_containing("\#bonjour_monde -rt", 100, client)
#p like_tweets_containing("\#bonjour_monde -rt", 25, client)
#send_tweets_to_journalists(journalists, client)
