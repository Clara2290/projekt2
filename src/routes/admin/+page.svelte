<script>
    let Brugernavn = '';
    let email = '';
    let Kodeord = '';

const addUser = async () => {
        fetch('api/user', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: Brugernavn,
                email: email,
                pass: Kodeord
            })
        })
    };

</script>

<h1>Administrator side!</h1>
<div><input bind:value={Brugernavn} placeholder="Brugernavn" /></div>
<div><input bind:value={email} placeholder="email" /></div>
<div><input bind:value={Kodeord} placeholder="Kodeord" /></div>

<button on:click={addUser}>Opret bruger 1</button>
