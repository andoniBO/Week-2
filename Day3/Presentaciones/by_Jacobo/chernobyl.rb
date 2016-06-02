#!/usr/bin/env ruby

# require 'security' # TODO: fixme
require 'rubygems'
require 'date'
require 'graph-ruby'



class ReactorCore

  def emc2
    energy_in = rand(100)
    energy = mass * SPEED_OF_LIGHT * SPEED_OF_LIGHT
  end

end


class NuclearController
  def perform_emergency_shutdown
    @reactor = Reactor.find(params[:id])

    if @reactor.status == "DEATH"
      EmergencyMailer.inform_workers(@reactor).deliver
      EmergencyMailer.inform_families(@reactor).deliver
      @reactor.emergency_shutdown
      @reactor.emergency_evacucation
      notice = "You are all dead now, thank you for using our system."
    else
      @reactor.emergency_shutdown
      notice = "That was close. You are not so dead yet."
    end
    redirecto_to @reactor, notice: notice
  end

  def generate_report
    @reactors = Reactor.all
    str = "<xml reactors=#{@reactors.count}>"
    str += @reactors.map{ |reactor|  "<reactor name=#{reactor.name}>....</reactor>" }.join
    str += "</xml>"
  end

  def show_energy
    @energy1 = @current_reactor.buffer - @current_reactor.energy_out
    @energy2 = @current_reactor.buffer - @current_reactor.energy_in
  end

  def emc2
    @core = ReactorCore.find(params[:id])
    @core.energy_in = rand(100)
    @core.energy = @core.mass * ReactorCore::SPEED_OF_LIGHT * ReactorCore::SPEED_OF_LIGHT
  end

end


def release_energy
  update(buffer: buffer - energy_out)
end

def recharge
  update(buffer: buffer + energy_in)
end

def formatted_status
  "<div class='#{name}'> #{status} </div>"
end

class ReactorCoreDecorator
  STATUSES = %w( OK WARNING NOT_OK DISASTER DEATH )

  def formatted_status
    content_tag :div, status.humanize
  end
end

class ReactorCoreWorker
  def perform(core_id)
    core = Core.find(id)
    core.energy_in = rand(1000)
    core.energy_out = core.output
    core.recharge
    core.release_energy
  end
end


STATUSES = %w( OK WARNING NOT_OK DISASTER DEATH )
@reactor = { name: "Chernobyl", date: Date.new(1986, 4, 26), threshhold: 500, current_status: "OK" }
@core = { energy_out: 500, buffer: 1000 }

while @core[:buffer] > 0

  # Energy calculations
  @core[:energy_in] = rand(1000)
  @core[:buffer] = @core[:buffer] - @core[:energy_out] + @core[:energy_in]
  enough_buffer = @core[:buffer] - @core[:energy_out]

  #status
  @core.delete(@reactor[:current_status])
  status = "OK"
  status = "WARNING" if enough_buffer < @reactor[:threshhold]
  status = "NOT_OK" if enough_buffer < (@reactor[:threshhold] / 2)
  status = "DISASTER" if enough_buffer < 0
  @core[status] = enough_buffer
  @reactor[:current_status] = status

  energy_modifier = case status
    when "OK" then 100
    when "WARNING" then -100
    when "NOT_OK" then -200
    when "DISASTER" then -300
  end

  @core[:energy_out] = @core[:energy_out] + energy_modifier

  GraphRuby.histogram! data: @core.dup, axis: 100
  sleep(1)
end

puts "DEATH"
