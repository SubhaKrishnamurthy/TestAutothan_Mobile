import io.cucumber.scala.{EN, ScalaDsl}

class Test123 extends ScalaDsl with EN {

  Given("""I'm on Autobahn Corporate user login page with {string},{string} & {string} aaa""") { (string: String, string2: String, string3: String) =>
    // Write code here that turns the phrase above into concrete actions
    throw new io.cucumber.scala.PendingException()
  }
  Given("""I'm on Autobahn landing page""") { () =>
    // Write code here that turns the phrase above into concrete actions
    throw new io.cucumber.scala.PendingException()
  }
}