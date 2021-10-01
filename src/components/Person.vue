<template>
  <v-container fluid fill-height>
    <v-row justify="center" class="text-center">
      <v-col cols="10" sm="7" lg="6">
        <v-card>
          <v-container fluid>
            <v-row class="mt-3" justify="center">
              <v-avatar size="80">
                <img :src="image" :alt="name" />
              </v-avatar>
            </v-row>

            <v-row justify="center">
              <v-card-title>
                <span class="text-lg-h3 text-h5 font-weight-black">
                  {{ name }}
                </span>
              </v-card-title>
            </v-row>

            <v-row justify="center">
              <v-divider class="mx-4"></v-divider>
            </v-row>

            <v-row justify="center">
              <v-card-title>
                <span class="text-lg-h4 text-h6 text-sm-h4 font-weight-medium">
                  Servicos disponíveis
                </span>
              </v-card-title>

              <v-card-text>
                <v-row justify="center">
                  <v-col cols="10" sm="7" lg="8">
                    <v-chip-group
                      multiple
                      column
                      active-class="blue accent-4 white--text"
                      v-model="selectedService"
                    >
                      <v-chip
                        filter
                        class="mx-1"
                        v-for="service of services"
                        :key="service"
                      >
                        <span class="text-lg-h6 text-subtitle-2 text-sm-h5">
                          {{ service }}
                        </span>
                      </v-chip>
                    </v-chip-group>
                  </v-col>
                </v-row>
              </v-card-text>
            </v-row>

            <v-row justify="center">
              <v-card-title>
                <span class="text-lg-h4 text-h6 text-sm-h4 font-weight-medium">
                  Horários disponíveis
                </span>
              </v-card-title>

              <v-card-text>
                <v-row justify="center">
                  <v-chip-group
                    multiple
                    active-class="blue accent-4 white--text"
                    v-model="selectedTime"
                  >
                    <v-chip
                      filter
                      class="mx-1"
                      v-for="time of times"
                      :key="time"
                    >
                      <span class="text-lg-h6 text-subtitle-2 text-sm-h5">
                        {{ time }}
                      </span>
                    </v-chip>
                  </v-chip-group>
                </v-row>
              </v-card-text>
            </v-row>

            <v-row class="ml-1 mt-5 mb-1" justify="start">
              <v-card-actions>
                <v-btn
                  @click="contact()"
                  color="error"
                  large
                >
                  Entrar em contato
                </v-btn>
              </v-card-actions>
            </v-row>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "Person",

  data: () => ({
    phone: "55111111111111",
    msg: "Olá gostaria de ver um orçamento com voce sobre o serviço",
    selectedTime: [],
    selectedService: [],
    email: "email@example.com.br",
    name: "Robot from website",
    image:
      "https://png.pngtree.com/element_our/20190601/ourlarge/pngtree-robot-free-button-png-picture-image_1338309.jpg",
    dialog: false,
    services: [
      "Montagem de bicicletas",
      "Revisão completa",
      "Lavagem e lubrificacao",
      "Assessoria para compra e venda de bikes e acessórios",
      "Aulas de bike",
      "Outro"
    ],
    times: ["10:00", "11:00", "13:00", "14:00", "15:00", "16:00", "17:00"],
  }),
  methods: {
    arrayIntToText(arrayInt, arrayString) {
      let string = "";
      for (let i in arrayInt) {
        string += `${arrayString[i]} `
      }
      return string
    },
    contact() {
      if (this.phone && this.selectedService) {

        window.open(`https://api.whatsapp.com/send?phone=${this.phone}&text=${this.msg} ${this.arrayIntToText(this.selectedService, this.services)} no horário ${this.arrayIntToText(this.selectedTime, this.times)}`, '_blank')
      }
    }
  }
};
</script>
