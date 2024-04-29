<script>
    import {goto} from '$app/navigation';
    function navigationTostress() {
        goto('/api/dairy/stress');
    } 
    function navigationToenergi() {
        goto('/api/dairy/energi');

    } function navigationTougeplan() {
        goto('/home');
    } 
</script>
<div class="image-container">
    <img src="/logo.png" alt="Logo">
</div>

<style> img{
    width: 20%;
    float: center;
}

.image-container {
    display: flex; /* Anvender Flexbox */
    justify-content: center; /* Centrerer børneelementer horisontalt */
    align-items: center; /* Centrerer børneelementer vertikalt */
    height: 30vh; /* Sætter containerens højde til hele viewport-højden */
  }

.button-container {
        text-align: center; /* Centrer knapperne vandret */
        margin-top: 20px; /* Tilføj margin øverst */

}
    button {
        background-color: #42a5f5;
        color: white; /* Sæt tekstfarven til hvid for bedre kontrast */
        border: none; /* Fjern kantlinjen */
        padding: 20px 30px; /* Tilpas polstring efter behov */
        margin: 5px; /* Tilføj margin omkring knapperne */
        border-radius: 10px; /* Tilføj afrundede hjørner til knappen */
    }

.logud{
    float: right;
    margin-top: 400px;

}

</style>


<div class="button-container">
    <button on:click={navigationTostress}>Hvad gør dig stresset?</button>
    <button on:click={navigationToenergi}>Hvad giver dig energi?</button>
    <button on:click={navigationTougeplan} >Ugeplan</button>
</div>

<div class="logud">
    <button>Log ud</button>
</div>
