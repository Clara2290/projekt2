
<script>
    let Brugernavn = '';
    let Kodeord = '';
  
   const login = async () => {
        const response = await fetch('/api/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ Brugernavn, Kodeord })
        });
        const result = await response.text();
        console.log(result);
        if (response.status === 200) {
            window.location = '/api/start';
        } else {
            alert('Forkert brugernavn eller password');
        }
    };

</script>

<style>
img{
        width: 50%;
        display: block; 
        margin: 0 auto; 
    
}

.container {
        display: flex;
        justify-content: center; 
        align-items: center; 
        height: 50vh; 
    }

    input {
        display: block; 
        margin: 10px auto; 
    }

button {
        background-color: #42a5f5;
        color: white; 
        border: none; 
        padding: 10px 20px; 
        margin: 10px; 
        border-radius: 10px; 
}

</style>

<div class="container">
    <h1><img src="/logo.png"></h1>
</div>

<div style="text-align: center;">
    <input bind:value={Brugernavn} placeholder="Brugernavn" />
</div>
<div style="text-align: center;">
    <input bind:value={Kodeord} type="password" placeholder="Kodeord" />
</div>

<button style="display: block; margin: 0 auto;" color="primary" on:click={login}>Login</button> 