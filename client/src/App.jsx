import { useEffect, useState } from 'react';
import './App.css';

function App() {
  const [showSignInModal, setShowSignInModal] = useState(false);
  const [showRegisterModal, setShowRegisterModal] = useState(false);
  const [isSignedIn, setIsSignedIn] = useState(false);
  const [user, setUser] = useState(null);

  const handleSignIn = async (e) => {
    e.preventDefault();
    const email = e.target[0].value;
    const password = e.target[1].value;
    try {
      const res = await fetch('/api/login', {
	method: "POST",
	mode: 'cors',
	headers: {'Content-Type': 'application/json'},
	body: JSON.stringify({email, password})
      });
      const data = await res.json();
      if (res.ok) {
        alert('Login Successful');
	localStorage.setItem('token', data.token);
	setUser(data.user);
        setShowSignInModal(false);
	setIsSignedIn(true);
      } else {
        alert(data.error || 'Login Failed');
      }
    } catch (err) {
      alert(err);
    }
  };

  return (
    <div className="App">

      {showSignInModal && (
        <div className='modal'>
          <span className='close' onClick = {() => setShowSignInModal(false)}>&times;</span>
          <h1>Log In</h1>
          <form className='LogInForm' onSubmit={handleSignIn}>
            <div className='field_pod'>
              <p>Email: </p>
              <input type="email"></input>
            </div>
            <div className='field_pod'>
              <p>Password: </p>
              <input type="password"></input>
            </div>
            <button type="submit">submit</button>
          </form>
        </div>
      )}

      <div className="Header">
        <img src="/logo.webp" alt="GardenPlot logo" className="logo"></img>
        <h1 className="Title">GardenPlot</h1>
	{isSignedIn && user
		? <h2 className="hello_user">Hello, {user.name}!</h2>
		: <button className="reglog_cta" onClick={() => setShowSignInModal(true)}> Log In / Register </button>
	}
      </div>

      <div className='MainNav'>
        <p>weather</p>
        <p>plants</p>
        <p>garden planning</p>
        <p>my plots</p>
      </div>
    </div>
  );
}

export default App;
