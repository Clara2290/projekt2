
<script>
    let Brugernavn = '';
    let email = '';
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
            window.location = '/admin';
        } else {
            alert('Forkert brugernavn eller password');
        }
    };

</script>

<h1><img src="/logo.png"></h1>

<style>
img{
    width: 30%;
}
</style>

<div><input bind:value={Brugernavn} placeholder="Brugernavn" /></div>
<div><input bind:value={Kodeord} placeholder="Kodeord" /></div>
<button color="primary" on:click={login}>Login</button> 

