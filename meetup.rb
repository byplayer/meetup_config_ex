# Sample class to load configuration
class Meetup
  attr_accessor :group, :organizer, :sponsors

  def self.load(path)
    mt = new
    File.open(path, 'r') do |file|
      loader = MeetupLoader.new(mt)
      loader.instance_eval(file.read, path)
    end

    mt
  end
end

# configuration loader
class MeetupLoader
  def initialize(mt)
    @meetup = mt
  end

  def meetup(&block)
    instance_eval(&block)
  end

  def group(g)
    @meetup.group = g
  end

  def organizer(o)
    @meetup.organizer = o
  end

  def sponsors(s)
    @meetup.sponsors = s
  end
end
