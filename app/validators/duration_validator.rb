class DurationValidator < ActiveModel::Validator
  def validate(record)
    if record.movie_id
      if record.duration < record.movie.runtime
        record.errors.add :base, 'Duration must be greater than or equal to movie runtime'
      end
    end
  end
end