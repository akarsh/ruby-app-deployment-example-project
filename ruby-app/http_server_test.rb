# frozen_string_literal: true

require 'socket'
require 'test/unit'

# Test the server with two unit tests
class ServerTest < Test::Unit::TestCase
  def test_http_server_hello_world
    server = TCPSocket.open('0.0.0.0', 80)
    request = 'GET HTTP/1.1\r\n'

    server.puts(request)

    response = ''

    while (line = server.gets)
      response += line
    end

    expected = 'Well, hello there!'

    assert_equal expected, response
    server.close
  end

  def test_http_server_healthcheck
    server = TCPSocket.open('0.0.0.0', 80)
    healthcheck_request = 'GET /healthcheck HTTP/1.1'

    server.puts(healthcheck_request)

    healthcheck_response = ''

    while (line = server.gets)
      healthcheck_response += line
    end

    healthcheck_expected = 'OK'

    assert_equal healthcheck_expected, healthcheck_response
    server.close
  end
end
