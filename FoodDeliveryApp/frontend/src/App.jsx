
import { useEffect, useState} from "react"

function App() {
    const [restaurants, setRestaurants] = useState([])

    useEffect(()=> {
        fetch("http://localhost:8080/restaurants")
            .then(res => res.json())
            .then(data => setRestaurants(data))
            .catch(err => console.error("Error fetching restaurants:", err))
    },[])
    
    return (
        <div style={{fontFamily:'system-ui, sans-serif', padding:20}}>
            <h1>Food Delivery App</h1>
            <h2>Available Restaurants</h2>
            <ul>
                {restaurants.map(r => (
                    <li key={r.id}>
                        <b>{r.name}</b> – {r.city}
                    </li>
                ))}
            </ul>
        </div>
    )
}

export default App