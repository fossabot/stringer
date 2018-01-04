# frozen_string_literal: true

class DebugController < ApplicationController
  def show
    @queued_jobs_count = Delayed::Job.count
  end
end
