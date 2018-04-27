describe 'App' do
  it 'shows game page' do
    get '/'

    expect(last_response).to be_ok
    expect(last_response.body).to include 'Rock Paper Scissors Game'
    expect(last_response.body).to include '<form action="/throw" method="post">'
  end

  it 'shows result of game' do
    post '/throw', { sign: 'rock' }

    expect(last_response).to be_ok
    expect(last_response.body).to include 'You throwed <strong>rock</strong>'
    expect(last_response.body).to include 'Computer throwed'
    expect(last_response.body).to match /(WIN|TIE|LOSS)/
  end

  it 'does not show result of game when param is not passed' do
    post '/throw'

    expect(last_response).to be_ok
    expect(last_response.body).to_not include 'You throwed'
  end
end
